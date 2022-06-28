# Client

A client that consumes the sum API

## Environment variables for Configuration

| Name | Description | Example  |
| ---- | ----------- | -------- |
| `SERVER_URL` |  API server url | `http://localhost:4567` |

## Running the application

`ruby app.rb`

## Endpoints

| Method | Path | Description |
| -----  | ---- | ----------- |
| GET    | /    | Returns the latest sum |
| GET    | /sum?n=5 | Calculates the sum |
