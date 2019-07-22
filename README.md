# docker-interview
This repo defines a simple Flask echo server that is designed to run behind an NGINX reverse proxy all inside of a Docker container.

The repo has been seeded with some bugs designed to evaluate an interview candidates familiarity with Docker, NGINX, and Python.

## Desired Behavior
When functioning properly this app should respond to all http requests by echoing some metadata about the request to the requester. 

For example, running

```bash
curl localhost/api/v2/test -X POST -d '{"key1":"value1", "key2":"value2"}' -H "Content-Type: application/json"
```
will yield
```json
{
  "data": "{\"key1\":\"value1\", \"key2\":\"value2\"}",
  "endpoint": "api/v2/test",
  "form": {},
  "json": {
    "key1": "value1",
    "key2": "value2"
  }
}
```
## Building the app
1. Clone the repo
2. cd into the repo
3. run
```bash
docker build -t echo-server:latest .
```
4. run
```bash
docker run -p 80:80 --name echo --rm echo-server:latest
```

