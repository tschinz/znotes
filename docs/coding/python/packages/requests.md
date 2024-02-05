---
tags:
- coding
- python
- packages
- requests
---
# Requests

![](img/requests.jpg){.center width="40.0%"}

`Requests` is building on the most downloaded Python library in the world, `urllib3`. It makes web requests really simple, yet remains very powerful and versatile. Chances are you know this one by heart already, but I couldn't make this list without mentioning it!

- [Requests on PIP](https://pypi.org/project/requests/)
- [Requests on RTD](https://requests.readthedocs.io/en/master/)

## Install

``` bash
pip install requests
```

## Usage

A request is made up of four different pieces:

- An **endpoint** --- which looks like the *URL* to the data
- A **method** --- either `GET`, `PUT`, `POST`, or `DELETE`. We'll only be exploring `GET` requests in this post.
- The **headers** --- which provide information such as authentication keys.
- The **data/body** --- which isn't part of a `GET` request

Return Codes:

- `1xx`: Provide information
- `2xx`: Generally are successful
- `3xx`: Provide information on redirects
- `4xx`: Refer to a client error (our bad)
- `5xx`: Refer to a server error (their bad)

## Import

``` python
import requests
```

## Example

``` python
import requests
response = requests.get("http://api.open-notify.org/iss-now.json")
print(response.status_code)

#-----------------------------------------------------------------
# 200
```

``` python
import requests
import json
response = requests.get("http://api.open-notify.org/iss-now.json")
print(response.json())

#--------------------------------------------------------------------
# {'message': 'success', 'timestamp': 1583154620,
# 'iss_position': {'longitude': '-28.1832', 'latitude': '7.4263'}}
```

``` python
response = requests.get("http://api.open-notify.org/iss-now.json")
json_response = response.json()
dictionary = json.dumps(response.json(), sort_keys = True, indent = 4)
print(dictionary)

# -----------------------------------------------------------------------
# {
#     "iss_position": {
#         "latitude": "29.2380",
#         "longitude": "-117.4817"
#     },
#     "message": "success",
#     "timestamp": 1583170890
# }
```