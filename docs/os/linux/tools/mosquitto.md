---
tags:
- os
- operating system
- linux
- tools
- mosquitto
---
# Mosquitto
![](img/mosquitto.svg){.center width="40.0%"}

Eclipse Mosquitto is an open source (EPL/EDL licensed) message broker that implements the MQTT protocol versions 5.0, 3.1.1 and 3.1. Mosquitto is lightweight and is suitable for use on all devices from low power single board computers to full servers.

The MQTT protocol provides a lightweight method of carrying out messaging using a publish/subscribe model. This makes it suitable for Internet of Things messaging such as with low power sensors or mobile devices such as phones, embedded computers or microcontrollers.

The Mosquitto project also provides a C library for implementing MQTT clients, and the very popular mosquitto_pub and mosquitto_sub command line MQTT clients.

For more information see [https://mosquitto.org](https://mosquitto.org)

## Installation

``` bash
sudo apt-get install mosquitto
sudo apt-get install mosquitto-clients
```

## Usage

``` bash
sudo service mosquitto stop
```

``` bash
sudo service mosquitto start
```

## Configuration

Default configuration can be found at:

``` bash
/etc/mosquitto/mosquitto.conf
```

Example config file can be found at:

``` bash
/usr/share/doc/mosquitto/examples/mosquitto.conf.example
```

Custom config file needs to be placed at

``` bash
/etc/mosquitto/conf.d/
```

## Password file

Create a new password file

``` bash
# Create empty password file
touch /etc/mosquitto/mosquitto_passwd
# Fill password file
mosquitto_passwd -c /etc/mosquitto/mosquitto_passwd username password
```

To add a new user to the existing password file use:

``` bash
mosquitto_passwd -b /etc/mosquitto/mosquitto_passwd username password
```

For activating the passwordfile you need to create a custom config file `/etc/mosquitto/conf.d/mosquitto.conf` and att the following lines:

``` bash
allow_anonymous false
password_file /etc/mosquitto/mosquitto_passwd
```

## Python example

More informations at [http://www.steves-internet-guide.com/client-connections-python-mqtt/](http://www.steves-internet-guide.com/client-connections-python-mqtt/)

Install the `paho-mqtt` library

``` bash
sudo pip3 install paho-mqtt
```

``` python
import paho.mqtt.client as mqtt

# connection callback
def on_connect(client, userdata, flags, rc):
   print("Connected with result code " + str(rc))

# message received callback
def on_message(client, userdata, msg):
   print(msg.topic + " " + str(msg.payload))
   client.publish("/out", "received an input...")

# set up the client
client = mqtt.Client()
client.on_connect = on_connect
client.on_message = on_message
client.connect("mqtt.eclipse.org", 1883, 60) # address ip, port number, keep alive

# subscribe
client.subscribe("/in")

# process the MQTT business
client.loop_forever()
```

### Paho Return Codes

Connection Return Codes

- `0`: Connection successful
- `1`: Connection refused -- incorrect protocol version
- `2`: Connection refused -- invalid client identifier
- `3`: Connection refused -- server unavailable
- `4`: Connection refused -- bad username or password
- `5`: Connection refused -- not authorised
- `6`-`255`: Currently unused.