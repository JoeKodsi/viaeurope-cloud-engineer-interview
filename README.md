# ViaEurope Cloud Engineer Interview Problem

## Overview

1. Fork the repository
2. Get familiar with the application. We're here to answer any questions you might have!
3. Deploy the application!
4. After the session, please set your fork to private

## Architecture

![Architecture Diagram](/images/architecture.svg)

## Public Endpoints

| Path | Description |
| ---- | ----------- |
| /    | Get latest sum | 
| /?n={number} | Calculate sum for 1..number |

## Running the application locally

```bash
docker compose up
curl http://localhost:7777 # Last sum was: 0
curl http://localhost:7777/?n=3 # Your sum was 15
curl http://localhost:7777 # Last sum was: 15
```

## Task

Deploy the application.

#### Requirements

1. The application should be hosted on AWS
1. We'd like to version our infrastructure, so please use your favorite IaC
   tool. You can add your code in the `infrastructure` directory.
1. Client should be publicly accessible. The client exposes port `4567`
1. API and redis should be private. The API exposes port `4567`

#### Out of scope

1. Hosting the state file locally for the infrastructure is totally fine.

## Follow Up Tasks

Now that the application is deployed, there are some additional requirements we can consider. If you think of other important tasks not on this list, please tell us and feel free do them! We don't expect you to finish all/any of these tasks in the session! 

### 1. Redis recovers state on restart

Right now Redis's state is lost if the redis server is restarted. We'd like to persist the state between restarts.

Redis can be configured to write to disk using `redis-server --appendonly yes`. The redis server then writes its
state to `/data` inside the container.

### 2. The API server should recover from crashes

The api server crashes if the following endpoint is accessed: `/?n=13`

The api server should automatically restart

### 3. Replicas

We want to have 2 Client and API servers in order to have some redundancy.

### 4. The API server should scale up automatically

Requesting a sum with a large number takes up a lot of CPU time.

Example: `/?n=999999999`

The API server should autoscale to handle the additional load traffic.

### 5. Blue / Green deployment

In order to improve up-time, we want to gradually deploy changes.

### 6. Grant developers access to irb console

Developers want to access the running application in order to debug it. 
The command to access a REPL is `irb`

Example: `docker compose exec -it client irb`

### 7. Continuous Deployment

When a new commit is pushed to github, we should automatically build and deploy
the docker image.
