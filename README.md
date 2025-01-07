# synapsis

# Required

# Commands

## Unit Testing
```sh
fvm flutter test
```


## Unit Testing Coverage
```sh
# Generate `coverage/lcov.info` file
fvm flutter test --coverage
# Generate HTML report
# Note: on macOS you need to have lcov installed on your system (`brew install lcov`) to use this:
genhtml coverage/lcov.info -o coverage/html
# Open the report
open coverage/html/index.html
```



# **TASK**

## **Slicing UI (45 point)**

- [ ] Register Device (Installation Wizard) Page (5 points)
- [ ] Waiting Activation Page (5 points)
- [ ] Login Page (5 points)
- [ ] Success and Failed Login Pop-up (5 points)
- [ ] On Duty Page with dummy data and static image (10 points)
- [ ] New Message Pop-up (5 points)
- [ ] Chat Page (10 points)

---

## **API and Websocket Integration (95 point)**

### **Installation Wizard Page (35 Point)**

- [ ] Generate a device ID using a random string. Check the device status via API using the device ID in ‘get device by
  id’ endpoint (5 point)
- [ ] Connect and subscribe to the WebSocket channel /equipments/devices/$deviceId/activated using Centfigue v.0.8.0
- [ ] If the device has not been registered (the response is Device Not Found!), then register it using the ‘register
  device’ endpoint (5 points)
- [ ] If it is registered but not yet activated (value of is_active is false), it should be redirected to the Waiting
  Activation Page (5 points)
- [ ] Then, activate the device manually via postman using ‘update activation’ endpoint (please login using ‘login
  admin’ first). Make sure is_active value is true, it will automatically send data via websocket
- [ ] If the device status is active (based on is_active value), or if WebSocket has sent data with the value of
  data['is_active'] is true, it will automatically be directed to LoginPage (10 points)

### **Login Page (10 Point)**

- [ ] Integrate the Login Page with the API Success login (5 point)
- [ ] Integrate the Login Page with the API Failed login (5 point)

### **New chat pop-up  (20 point)**

- [ ] Subscribe to websocket channel /monitoring/messages/equipments/$unitId (10 point)
- [ ] To send a new message to your device, login with the endpoint ‘login admin’ and use ‘send message from web’
  endpoint to get a new message.
- [ ] If a new message arrives, show a new chat pop-up. If the user slides to "balas" or "mengerti," close the pop-up (
  10 points).

### **Chat page (30 point)**

- [ ] Use the ‘get template message’ endpoint to fetch message templates (5 points)
- [ ] Integrate with API to fetch all messages using ‘get all messages’ endpoint  (5 point)
- [ ] Display any real-time messages from the WebSocket channel (point c.ii) on the Chat Page immediately (15 points).
- [ ] Send new message to API using ‘send message’ endpoint with the request body  (5 point)

---

## **Testing**

- [ ] Implement Unit testing

---

## **Etc**

- [ ] Build and running on linux (50 points)

---

## **Documentation**

- [ ] Create technical documentation (30 points
