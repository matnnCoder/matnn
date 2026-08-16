# 第15章：HTTP网络请求

## 15.1 Http 对象概述

`Http` 对象提供了 HTTP 网络请求功能，支持 GET、POST、PUT、DELETE 等常用 HTTP 方法。

## 15.2 GET 请求

```matnn
Console.log("=== HTTP GET 请求 ===");

var response = Http.get("http://httpbin.org/get");
Console.log("响应:", response);
Console.log("状态码:", response.status);
Console.log("是否成功:", response.ok);
```

**输出结果**：

```
=== HTTP GET 请求 ===
响应: {...}
状态码: 200
是否成功: true
```

## 15.3 POST 请求

```matnn
Console.log("=== HTTP POST 请求 ===");

var postBody = '{"name":"matnn","version":"1.0"}';
var headers = {};
headers["Content-Type"] = "application/json";

var postResponse = Http.post("http://httpbin.org/post", postBody, headers);
Console.log("POST 响应:", postResponse);
Console.log("状态码:", postResponse.status);
```

**输出结果**：

```
=== HTTP POST 请求 ===
POST 响应: {...}
状态码: 200
```

## 15.4 PUT 请求

```matnn
Console.log("=== HTTP PUT 请求 ===");
var putBody = '{"updated":"true"}';
var putResponse = Http.put("http://httpbin.org/put", putBody);
Console.log("PUT 响应:", putResponse);
```

**输出结果**：

```
=== HTTP PUT 请求 ===
PUT 响应: {...}
```

## 15.5 DELETE 请求

```matnn
Console.log("=== HTTP DELETE 请求 ===");
var deleteResponse = Http.delete("http://httpbin.org/delete");
Console.log("DELETE 响应:", deleteResponse);
```

**输出结果**：

```
=== HTTP DELETE 请求 ===
DELETE 响应: {...}
```

## 15.6 自定义请求

```matnn
Console.log("=== HTTP 自定义请求 ===");
var customResponse = Http.request("GET", "http://httpbin.org/headers");
Console.log("自定义请求响应:", customResponse);
```

**输出结果**：

```
=== HTTP 自定义请求 ===
自定义请求响应: {...}
```

## 15.7 请求头

```matnn
Console.log("=== 设置请求头 ===");
var headers = {};
headers["Content-Type"] = "application/json";
headers["Authorization"] = "Bearer token";
headers["User-Agent"] = "Matnn/1.0";

var response = Http.get("http://httpbin.org/headers", headers);
Console.log("响应:", response);
```

## 15.8 响应对象

响应对象包含以下属性：

- `status`: 状态码
- `ok`: 是否成功（状态码 200-299）
- `headers`: 响应头
- `body`: 响应体

```matnn
var response = Http.get("http://httpbin.org/get");
Console.log("状态码:", response.status);
Console.log("是否成功:", response.ok);
Console.log("响应体:", response.body);
```

## 15.9 本章小结

本章介绍了 Matnn 的 HTTP 网络请求：

- `Http.get()` 发送 GET 请求
- `Http.post()` 发送 POST 请求
- `Http.put()` 发送 PUT 请求
- `Http.delete()` 发送 DELETE 请求
- `Http.request()` 发送自定义请求
- 支持设置请求头
- 响应对象包含状态码、是否成功、响应头和响应体

下一章将介绍 Date 日期时间。