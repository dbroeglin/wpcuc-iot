import json
import os
import time

from azure.iot.device import IoTHubDeviceClient, Message

JSON_FILE = os.getenv('JSON_FILE', '/var/run/wpcuc.json')
CONNECTION_STRING = os.getenv('CONNECTION_STRING')
if not(CONNECTION_STRING and CONNECTION_STRING.strip()):
    raise "Could not find CONNECTION_STRING environment variable"


client = IoTHubDeviceClient.create_from_connection_string(CONNECTION_STRING) 

with open(JSON_FILE) as file:
    data = file.read()
    message = Message(data)

    message.custom_properties["level"] = "storage"

    print( "Sending message: {}".format(message) )
    client.send_message(message)
