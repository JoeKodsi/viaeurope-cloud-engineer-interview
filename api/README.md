# API

API that calculates sums. Latest result is stored in redis.

## Environment variables for Configuration

| Name | Description | Example  |
| ---- | ----------- | -------- |
| `REDIS_URL` |  Redis server url | `redis://localhost:6379/api` |

## Running the application

`ruby app.rb`

## Endpoints

| Method | Path | Payload    | Description |
| -----  | ---- | ---------- | ----------- |
| GET    | /    |            | Returns the latest sum |
| POST   | /sum | {"n": 42}  | Calculates the sum |
| POST   | /sum | {"n": 13}  | Crashes the application  |
| POST   | /sum | {"n": 9999999999}  | Takes a long time to calculate and takes 100% CPU |
