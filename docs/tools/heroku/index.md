---
tags:
- tools
- heroku
---
#  Heroku

![](img/logo.svg){.center width="20%"}

[Heroku](https://dashboard.heroku.com) is a cloud platform as a service (PaaS) supporting several programming languages. One of the first cloud platforms, Heroku has been in development since June 2007, when it supported only the Ruby programming language, but now supports Java, Node.js, Scala, Clojure, Python, PHP, and Go. For this reason, Heroku is said to be a polyglot platform as it has features for a developer to build, run and scale applications in a similar manner across most languages.

How to deploy Heroku for a python application see also: [PLotly Dash](../../coding/python/plotly_dash.md).

# Heroku CLI

Heroku provides a commandline interface to access the log of the webserver. The deploy activity can be seen on the webinterface, but the webserver logs only via the `heroku-cli`.

- [Heroku CLI Documentation](https://devcenter.heroku.com/articles/heroku-cli)

``` bash title="Basic heroku-cli commands"
# See list of deployed apps
heroku apps

# See log of one app
heroku logs -a choose-your-app-name
```
