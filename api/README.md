# API

API that calculates sums for 1..n. Latest result is stored in redis.

Runs on port `4567` by default

## Environment variables for Configuration

| Name | Description | Example  |
| ---- | ----------- | -------- |
| `REDIS_URL` |  Redis server url | `redis://localhost:6379/api` |

## Running the application

`ruby app.rb`

`open http://localhost:4567`

## Endpoints

| Method | Path | Payload    | Description |
| -----  | ---- | ---------- | ----------- |
| GET    | /    |            | Returns the latest sum |
| GET    | /healthcheck |    | Returns OK |
| POST   | /sum | {"n": 42}  | Calculates the sum 1..n |
| POST   | /sum | {"n": 13}  | Crashes the application  |
| POST   | /sum | {"n": 9999999999}  | Takes a long time to calculate and takes 100% CPU |
