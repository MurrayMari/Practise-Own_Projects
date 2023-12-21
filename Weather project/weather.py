# The API I have used is 'Open Weather'.
# A key is needed to access it, please make an account on "https://openweathermap.org/" and
# create a key under the API key tab.
# Within my code I used Open Weather to get the weather at the location of the user using latitude and longitude.
# I also used Open Weather to get the time of sunrise and sunset at the user's location.

# Below I have used the 'Datetime' module as my additional module.
# It can be imported by opening the terminal and entering the command below:
# pip install DateTime
# I use Datetime to get the current time as well as to compare the times of sunrise and sunset with the current time.

import requests
import datetime
from datetime import datetime as dt


today = datetime.datetime.now()
# creating the text file weather.txt using inbuilt function open()
# and writing to the file the current date and time.
with open('weather.txt', 'w+') as weather_file:
    weather_file.write(today.strftime("Today is %A %d of %B, and it's %H:%M \n"))

print("Hello, this program is here to create a file to advise you of a poem to go with the weather in your area:\n "
      "For this program to work you will need an apikey from OpenWeatherMap.\n "
      "And also know your Latitude and Longitude in Decimal degrees (DD) - Available through Google Maps")

# greeting the user and using string slicing
your_name = input("Firstly, Lets give you a Jame's Bond style code name.\nWhat is your name? ")
codename = your_name[0:1]
print(f"Hello {codename}")


# using inbuilt function (input) to get required information from the user
lat = input('Please input your latitude? ')
lon = input('Please input your longitude? ')
apikey = input('Please input your api key from OpenWeather? ')


# checking if the Api key has the right number of characters - if not prints error messages
if len(apikey) != 32:
    print("Oh no - your API key isn't quite right")
    with open('weather.txt', 'a+') as weather_file:
        weather_file.write("Please check your API key")
else:
    print("Please check the file \'weather.txt\' for my excellent recommendations.")


# # Sample lat&lon for testing
# # Barbados
# lat = 13.193887
# lon = -59.543198
# # New York
# lat = 40.697715
# lon = -73.974944
# # London
# lat = 51.509865
# lon = -0.118092

# Calling the api and getting the main weather for the current time in their area
url = 'https://api.openweathermap.org/data/2.5/weather?lat={}&lon={}&appid={}'.format(lat, lon, apikey)
response = requests.get(url)
currentweather = response.json()
rightNow = currentweather['weather'][0]['main']
# Writing the info to the weather_file
with open('weather.txt', 'a+') as weather_file:
    weather_file.write(f'The current weather in your locations is; {rightNow} \n')


# Taking the main weather and assigning it an appropriate poem using if, elif, else
def assign_poem(weather):  # using booleans to make decisions
    if weather == "Clouds":
        return "\"I Wandered Lonely as a Cloud\" by William Wordsworth\n"
    elif weather == "Rain" or weather == "Drizzle":
        return "\"Rain Poem\" by Edward Thomas\n"
    elif weather == "Snow":
        return "\"Dust Of Snow Poem\" by Robert Frost\n"
    elif weather == "Thunderstorm":
        return "\"A Thunderstorm\" by Emily Dickinson\n"
    elif weather == "Tornado":
        return "Theres a Tornado - stop reading poetry and go to a shelter!!\n"
    elif weather == "Ash":
        return "\"I have never seen \"Volcanoes\"\" by Emily Dickinson\n"
    elif weather == "Smoke":
        return "\"Upon The Hearth The Fire is Red\" by J.R.R. Tolkien\n"
    elif weather == "Haze":
        return "\"Haze\" by Carl Sandburg\n"
    elif weather == "Squall":
        return "\"Y Gwynt (The Wind)\" by Dafydd ap Gwilym\n"
    elif weather == "Mist" or "Fog":
        return "\"Mist\" by Maurice Rutherford\n"
    elif weather == "Dust":
        return "\"Dust\" by Florence Ripley Mastin\n"
    elif weather == "Sand":
        return "\"Drummer Hodge\" by Thomas Hardy, also the song \"Sandstorm\" by Darude would be very fitting\n"
    elif weather == "Clear":
        return "\"O Sun of Real Peace\" by Walt Whitman\n"
    else:
        return "Oh no! You\'re area's data might not be available.\n"


poem_result = assign_poem(rightNow)


# writing the result/recommendation to the weather_file
with open('weather.txt', 'a+') as weather_file:
    weather_file.write(f'You should read {poem_result}')

# Getting timestamps of sunrise and sunset from OpenWeather API and storing them in a list
light = currentweather['sys']
lightkeys = ["sunrise", "sunset"]
lightvalues = [light[key] for key in lightkeys]   # using a for loop
sunrise = lightvalues[0]
sunset = lightvalues[1]

# converting them into more easily comparable values with datetime
datetime_sunrise = (datetime.datetime.fromtimestamp(int(sunrise)).strftime('%H:%M'))
datetime_sunset = (datetime.datetime.fromtimestamp(int(sunset)).strftime('%H:%M'))
# making the time of sunrise and sunset a comparable value to just the time right now
time_of_sunrise = dt.strptime(datetime_sunrise, '%H:%M')
time_of_sunset = dt.strptime(datetime_sunset, '%H:%M')
todaytime = today.time()
just_time_of_sunset = time_of_sunset.time()
just_time_of_sunrise = time_of_sunrise.time()


# checking if the user will need a light to read their poem
def date_or_night():   # using booleans to make decisions
    if todaytime >= just_time_of_sunset or just_time_of_sunrise >= todaytime:
        return"I\'ve checked: it\'s night-time - \nYou may need a light."
    else:
        return"I\'ve checked: it\'s day-time - \nIt should be bright enough to read without a light."


do_i_need_a_light = date_or_night()

# writing the result to the weather_file
with open('weather.txt', 'a+') as weather_file:
    weather_file.write(do_i_need_a_light)
