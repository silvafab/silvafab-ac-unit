# Smart AC Unit

## API endpoints

##### NOTE
All POST request parameters are expected to be sent with ```application/x-www-form-urlencoded``` as the ```Content-Type```

Let's assume the serial numbers are case insensitive

#### POST: /register

Used for AC units to register in the system

###### Request

Parameters:
+ serialNumber
+ firmwareVersion

###### Response
```
200:OK
{}

If there's a validation error
400:Bad Request
"errors": {
	"serialNumber": "already registered"
}
```

###### cURL example

```
curl -X POST -d "serialNumber=123ABC&firmwareVersion=23.15" https://silvafab-ac-units.herokuapp.com/api/register
```
---

#### POST: /devices/:serialNumber/readings

Used for AC units to send readings from their sensors. If bulk readings are going to be sent, the
API assumes all fields are arrays, and they all have the same amount of items.

###### Request

Parameters:
+ temperature
+ airHumidity
+ carbonMonoxide
+ healthStatus

###### Response
```
200:OK
{}

404:Not Found
{}
```

###### cURL example

```
curl -X POST -d "temperature=25.1&airHumidity=24.1&carbonMonoxide=7.3&healthStatus=working_normal" https://silvafab-ac-units.herokuapp.com/api/devices/123ABC/readings
```

###### cURL example for bulk sending

```
curl -X POST -d "temperature[]=25.1&temperature[]=26.8&airHumidity[]=24.1&airHumidity[]=24.5&carbonMonoxide[]=7.3&carbonMonoxide[]=9&healthStatus[]=working_normal&health_status=gas_leak" https://silvafab-ac-units.herokuapp.com/api/devices/123ABC/readings
```

