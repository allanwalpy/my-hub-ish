#!/bin/bash

script_folder=$(dirname "$(readlink -fm "$0")")

key=$($script_folder/weather.secret key)
location=$($script_folder/weather.secret location)
url="api.openweathermap.org/data/2.5/weather?id=${location}&appid=${key}&cnt=5&units=metric&lang=en"

curl -s -o ~/.cache/weather.json $url
