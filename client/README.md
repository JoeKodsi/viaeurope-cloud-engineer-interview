# Client

A client that consumes the sum API

Runs on port `4567` by default

## Environment variables for Configuration

| Name | Description | Example  |
| ---- | ----------- | -------- |
| `SERVER_URL` |  API server url | `http://localhost:4567` |

## Running the client (without the api)

`ruby app.rb -p 1234`

`open http://localhost:1234`

## Endpoints

| Method | Path | Description |
| -----  | ---- | ----------- |
| GET    | /    | Returns the latest sum |
| GET    | /healthcheck | Returns OK |
| GET    | /sum?n=5 | Calculates the sum |
