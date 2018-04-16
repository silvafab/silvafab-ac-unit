# Smart AC Unit

## API endpoints

##### NOTE
All POST request parameters are expected to be sent with ```application/x-www-form-urlencoded``` as the ```Content-Type```

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

#### POST: /readings

Used for AC units to send readings from their sensors

###### Request

Parameters:
+ serialNumber
+ temperature
+ airHumidity
+ carbonMonoxide
+ healthStatus

###### Response
```
200:OK
{}

If there's a validation error
400:Bad Request
"errors": {
	"serialNumber": "not registered"
}
```

###### cURL example

```
curl -X POST -d "serialNumber=123ABC&temperature=25.1&airHumidity=24.1&carbonMonoxide=7.3&healthStatus=working_normal" https://silvafab-ac-units.herokuapp.com/api/readings
```
