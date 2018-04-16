# Smart AC Unit

## API endpoints

#### /register

Used for AC units to send their info

###### Request
Parameters are expected to be sent with ```application/x-www-form-urlencoded``` as the ```Content-Type```

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
