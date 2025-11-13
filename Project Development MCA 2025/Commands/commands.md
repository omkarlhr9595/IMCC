## Initialize Node Project


To Check Node js version

```bash
node --version
```



To initialize a new Node.js project:

```bash
npm init
```

Or for a quick start without interactive prompts:

```bash
npm init -y
```

To install nodemon pacakge gloablly

```bash
npm i -g nodemon
```

To install express package

```bash
npm install express --save
```

## Status Codes 

### Informational Responses (1xx)
- **100 Continue** - The server has received the request headers and the client should proceed to send the request body
- **101 Switching Protocols** - The requester has asked the server to switch protocols
- **102 Processing** - The server has received and is processing the request, but no response is available yet

### Successful Responses (2xx)
- **200 OK** - The request has succeeded
- **201 Created** - The request has been fulfilled and a new resource has been created
- **202 Accepted** - The request has been accepted for processing, but processing has not been completed
- **204 No Content** - The server successfully processed the request but is not returning any content
- **206 Partial Content** - The server is delivering only part of the resource due to a range header sent by the client

### Redirection Messages (3xx)
- **301 Moved Permanently** - The URL of the requested resource has been changed permanently
- **302 Found** - The URL of the requested resource has been changed temporarily
- **304 Not Modified** - The resource has not been modified since the last request
- **307 Temporary Redirect** - The request should be repeated with another URL
- **308 Permanent Redirect** - The resource is now permanently located at another URL

### Client Error Responses (4xx)
- **400 Bad Request** - The server cannot process the request due to a client error
- **401 Unauthorized** - Authentication is required and has failed or has not been provided
- **403 Forbidden** - The server understood the request but refuses to authorize it
- **404 Not Found** - The requested resource could not be found
- **405 Method Not Allowed** - The request method is not supported for the requested resource
- **406 Not Acceptable** - The server cannot produce a response matching the list of acceptable values
- **409 Conflict** - The request could not be completed due to a conflict with the current state
- **410 Gone** - The resource is no longer available and will not be available again
- **422 Unprocessable Entity** - The request was well-formed but contains semantic errors
- **429 Too Many Requests** - The user has sent too many requests in a given amount of time

### Server Error Responses (5xx)
- **500 Internal Server Error** - A generic error message when an unexpected condition was encountered
- **501 Not Implemented** - The server does not support the functionality required to fulfill the request
- **502 Bad Gateway** - The server, while acting as a gateway or proxy, received an invalid response
- **503 Service Unavailable** - The server is currently unable to handle the request
- **504 Gateway Timeout** - The server, while acting as a gateway or proxy, did not receive a timely response
- **505 HTTP Version Not Supported** - The server does not support the HTTP protocol version used in the request