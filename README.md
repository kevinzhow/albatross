# Albatross

A Swift webhook handler which designed to translate and forward Github Webhook to Other Webhook.

![Preview](./screenshot.png)

## Overview

Currently Albatross supports Feishu only.

[Albatross Docker Image](https://github.com/kevinzhow/albatross/pkgs/container/albatross) was build by Github Action and published to Github Packages.

Pull image from the command line:

```shell
docker pull ghcr.io/kevinzhow/albatross:latest
```

## Supported Github Event

- [x] ping
- [x] pull_request_review_comment
- [x] issues
- [x] issue_comment
- [x] commit_comment
- [x] pull_request
- [x] create
- [x] push

## Setup

### 1.Download docker-compose template

Download [docker-compose.yml](https://gist.github.com/kevinzhow/5f68c99760463a3dc195f7bd18ab64af) template here.

```yml
# albatross
version: '3.7'

services:
  app:
    image: ghcr.io/kevinzhow/albatross:latest
    restart: unless-stopped
    environment:
      LOG_LEVEL: ${LOG_LEVEL:-debug}
      ADMIN_USERNAME: albatross
      ADMIN_PASSWORD: albatross
    ports:
      - '1780:8080'
    volumes:
      - ./data:/app/data/
    #user: root  # uncomment to run as root if you runs docker-compose as root
    command:
      [
        "serve",
        "--env",
        "production",
        "--hostname",
        "0.0.0.0",
        "--port",
        "8080"
      ]
```

### 2.Up

```
docker-compose up
```

### Build-in TLS Supports

If you want to enable build-in TLS supports, please modify the `docker-compose.yml` as follows

```yaml
environment:
  ENABLE_TLS: "true"
  
volumes:
  - ./data:/app/data/
  - /path/to/cert.pem:/app/certs/cert.pem
  - /path/to/key.pem:/app/certs/key.pem
```

## Usage

### 1.Create Webhook Handler

Albatross uses `Basic Auth` with default username `albatross` and password `albatross`

```shell
curl --location --request POST 'https://yourdomain.com/hook/feishu' \
--header 'Authorization: Basic YWxiYXRyb3NzOjM1MmFkNWEyOTNjN2ExYzM4YmUyODk2NWFlNWExNjQ1' \
--header 'Content-Type: application/x-www-form-urlencoded' \
--data-urlencode 'title=webhook-name' \
--data-urlencode 'url=https://open.feishu.cn/open-apis/bot/v2/hook/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx'
```

#### Webhook Handler Create Response

Record your `{webhook-handler-id}`.

```json
{
  "url": "https://open.feishu.cn/open-apis/bot/v2/hook/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx",
  "id": "{webhook-handler-id}",
  "title": "webhook-name",
  "secret": null
}
```

### 2.Setup Github Webhook

Fill your github webhook form

| Field            | Value                                                   |
| ---------------- | ------------------------------------------------------- |
| Payload URL      | https://yourdomain.com/hook/feishu/{webhook-handler-id} |
| Content type     | application/json                                        |
| SSL verification | Enable SSL verification                                 |
