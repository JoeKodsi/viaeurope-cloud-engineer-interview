# Cloud Engineer Intervew

## Architecture

![Architecture Diagram](/images/architecture.svg)

## Public Endpoints

| Path | Description |
| ---- | ----------- |
| /    | Get latest sum | 
| /?n={number} | Calculate sum for 1..number |

## Running the application locally

1. `docker compose up`
2. `open http://localhost:4567`

## Tasks

The first task should be completed first, but the rest may be completed in any order. We don't expect you to finish all of the tasks.

### 1. Deploy application

#### Requirements

1. Client should be publicly accessible. The client exposes port `4567`
2. API and redis should be private. The API exposes port `4567`
3. Redis storage should persist between restarts

### 2. The API server should recover from crashes

The api server crashes if the following endpoint is accessed: `/?n=13`

The api server should automatically restart

### 3. Replicas

We want to have 2 Client and API servers in order to have some redundancy.

### 4. The API server should scale up automatically

Requesting a sum with a large number requires a lot of resources.

Example: `/?n=999999999`

The API server should scale up to handle additional traffic.

### 5. Blue / Green deployment

In order to improve up-time, we want to gradually deploy changes.

### 6. Grant developers access to irb console

Developers want to access the running application in order to debug it. 
The command to access a REPL is `irb`

Example: `docker compose exec -it client irb`

### 7. Continuous Deployment

When a new commit is pushed to github, we should automatically build and deploy
the docker image.
