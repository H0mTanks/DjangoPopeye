from django.shortcuts import render
from django.http import HttpResponse

from django.db import connection

def index(request):
    filter_checked = False
    query = "SELECT DISTINCT(dishes.name) FROM dishes"
    join_clause = " WHERE "
    filter_clause = ""
    if len(request.POST.getlist('allergy_check')) != 0:
        filter_checked = True
        filter_clause += "dishes.ID NOT in ( select prone.ID from prone where "
        for i in request.POST.getlist('allergy_check'):
            filter_clause += "prone.name = " + "'" + i + "'" + " OR "
        filter_clause = filter_clause[:-4]
        filter_clause += ") AND "

    if len(request.POST.getlist('cuisine_check')) != 0:
        filter_checked = True
        query += ", belongs_cuisine, cuisine"
        join_clause += "dishes.ID = belongs_cuisine.ID AND cuisine.name = belongs_cuisine.name AND "
        filter_clause += "( "
        for i in request.POST.getlist('cuisine_check'):
            filter_clause += "cuisine.name = " + "'" + i + "'" + " OR "
        filter_clause = filter_clause[:-4]
        filter_clause += ") AND "

    if len(request.POST.getlist('season_check')) != 0:
        filter_checked = True
        query += ", s_contains, in_season, seasonal_ingredients, season"
        join_clause += "dishes.ID = s_contains.ID AND seasonal_ingredients.name = s_contains.name AND seasonal_ingredients.name = in_season.ingredient_name AND season.name = in_season.season_name AND "
        filter_clause += "( "
        for i in request.POST.getlist('season_check'):
            filter_clause += "season.name = " + "'" + i + "'" + " OR "
        filter_clause = filter_clause[:-4]
        filter_clause += ") AND "

    if len(request.POST.getlist('flavor_profile_check')) != 0:
        filter_checked = True
        query += ", has_fp, flavor_profile"
        join_clause += "dishes.ID = has_fp.ID AND flavor_profile.name = has_fp.name AND "
        filter_clause += "( "
        for i in request.POST.getlist('flavor_profile_check'):
            filter_clause += "flavor_profile.name = " + "'" + i + "'" + " OR "
        filter_clause = filter_clause[:-4]
        filter_clause += ") AND "

    if len(request.POST.getlist('type_check')) != 0:
        filter_checked = True
        query += ", is_type, type"
        join_clause += "dishes.ID = is_type.ID AND type.name = is_type.name AND "
        filter_clause += "( "
        for i in request.POST.getlist('type_check'):
            filter_clause += "type.name = " + "'" + i + "'" + " OR "
        filter_clause = filter_clause[:-4]
        filter_clause += ") AND "

    if filter_checked:
        query = query + join_clause + filter_clause
        query = query[:-4]
    with connection.cursor() as cursor:
        cursor.execute(query)
        dishes = cursor.fetchall()
        cursor.execute("select name from allergies")
        allergies = cursor.fetchall()
        cursor.execute("select name from cuisine")
        cuisine = cursor.fetchall()
        cursor.execute("select name from season")
        seasons = cursor.fetchall()
        cursor.execute("select name from flavor_profile")
        flavor_profile = cursor.fetchall()
        cursor.execute("select name from type")
        type_dish = cursor.fetchall()
    context = {'dishes': dishes, 'allergies': allergies, 'cuisines': cuisine, 'seasons': seasons, 'flavor_profiles': flavor_profile, 'type_dish': type_dish}
    return render(request, 'popeye/index.html', context)

def detail(request, name):
    query = "SELECT ID, preptime, cooktime, calories, recipe FROM dishes WHERE name = '" + name + "'"
    addn_info =""
    with connection.cursor() as cursor:
        cursor.execute(query)
        dishes = cursor.fetchall()
        ID = dishes[0][0]
        cursor.execute("SELECT name FROM belongs_cuisine WHERE ID = " + str(ID))
        cuisine = cursor.fetchall()
        for c in cuisine[0]:
            cursor.execute("SELECT additional_info FROM cuisine WHERE name = '" + c + "'")
            addn_info += cursor.fetchall()[0][0] + "\r\n"
        cursor.execute("SELECT name FROM is_type WHERE ID = " + str(ID))
        tp = cursor.fetchall()
        cursor.execute("SELECT name FROM has_fp WHERE ID = " + str(ID))
        fp = cursor.fetchall()
        cursor.execute("SELECT name FROM prone WHERE ID = " + str(ID))
        allergy = cursor.fetchall()
        cursor.execute("SELECT name, quantity FROM s_contains WHERE ID = " + str(ID))
        s_ing = cursor.fetchall()
        cursor.execute("SELECT name, quantity FROM ns_contains WHERE ID = " + str(ID))
        ns_ing = cursor.fetchall()

    context = {'name': name, 'preptime':dishes[0][1], 'cooktime':dishes[0][2], 'calories':dishes[0][3], 'recipe':dishes[0][4], 'cuisine':cuisine, 'is_type':tp, 'has_fp':fp, 'allergy':allergy, 'addn_info':addn_info, 's_ing':s_ing, 'ns_ing':ns_ing}
    return render(request, 'popeye/detail.html', context)