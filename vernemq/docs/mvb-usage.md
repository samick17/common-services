# go-whiteboard-api

## Redis Usage

```go
type WhiteboardSessionType string

const (
	WhiteboardSessionHost  WhiteboardSessionType = WhiteboardSessionType("host")
	WhiteboardSessionGuest WhiteboardSessionType = WhiteboardSessionType("guest")
	WhiteboardSessionUser  WhiteboardSessionType = WhiteboardSessionType("user")
)

const (
	KeyUserPermission string = "userpermission:%s"
	cacheKey := r.Key(fmt.Sprintf(redis.KeyUserPermission, userToken.ID))

	KeyWhiteboardHost string = "wb:host:%s"
	key := r.Key(fmt.Sprintf(redis.KeyWhiteboardHost, wbsess.Code))


	KeyWhiteboardUser string = "wb:user:%s:%s:%s"
	cacheKey := r.Key(fmt.Sprintf(redis.KeyWhiteboardUser, reqBody.Body.Code, WhiteboardSessionUser, cache.Student.Code))


	KeyMQTTLogin string = "mqtt:login:%s:%s:%s"
	key := r.Key(fmt.Sprintf(redis.KeyMQTTLogin, code, "w", "t"))
)
```

## myviewboard.com-classroom-mqtt

```js
module.exports = {
  mqttLoginPrefix: 'mqtt:login:',
  whiteboardGuestPrefix: 'wb:user:',
  whiteboardHostPrefix: 'wb:host:',
  presentGuestPrefix: 'present:guest:'
}

let keys = await redis.client.keys(`${redisKeys.mqttLoginPrefix}w:t:*`)


let existsLogin = await redis.client.exists(`${redisKeys.mqttLoginPrefix}${username}:${pass}`)
if (existsLogin) {
  log.message = 'user already in cache list'
  sendLog(log)
  info(log.message)
  return callback(null, false)
}

````
