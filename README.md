# Albatross

A Swift webhook handler which designed to translate and forward Github Webhook to Other Webhook.

## Overview

Currently Albatross supports Feishu only.

[Albatross Docker Image](https://github.com/kevinzhow/albatross/pkgs/container/albatross) was build by Github Action and published to Github Packages.

Pull image from the command line:

```shell
docker pull ghcr.io/kevinzhow/albatross:v0.0.9
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

### 2.Prepare .env file

Defined a `.env` file with following params.

```
ALBATROSS_TAG=v0.0.9
LOCAL_CERT=/xx/cert.pem
LOCAL_KEY=/xx/key.pem
```

Excludes `LOCAL_CERT` and `LOCAL_KEY` if you don't need build-in tls support.

### 3.Up

```
docker-compose up
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
