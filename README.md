Language: [English](./README.md) | [中文简体](./README.zh.md)


# Fastodon

This is a Mastodon client that uses Flutter to summarize the knowledge of Flutter that I have learned before. This project involves common functions such as custom widgets, components, page jumps, etc., using common third-party packages such as dio, cached_network_image, etc. The goal is to develop an app that is compatible with both platforms and available.👏

[Mastodon](https://joinmastodon.org/)It is a free and open source decentralized distributed microblogging social network. Mastodon is an open source, web-based distributed microblogging software. The backend is written in Ruby on Rails, while the front end is written in JavaScript. This project utilizes its open source API implementation.[Development documentation is here](https://docs.joinmastodon.org/)。

## Install
This project was developed by Flutter, first to ensure that the local environment has a Flutter development environment. If it is not configured yet, please refer to[中文文档](https://flutterchina.club/docs/)and[English development documentation](https://flutter.dev/docs/get-started/install)

```
git clone https://github.com/mah93/Fastodon
cd ./Fastodon
flutter packages get
flutter run
```
You can successfully run in the simulator/real machine (both Android and iOS).

P.S. You can ask questions in [issuse](https://github.com/mah93/Fastodon/issuse) if you encounter any problems.

## Mastodon Guide

Mastodon Unlike Twitter, Mastodon is an open source project that allows users to create their own servers, and users between different servers can communicate without any gaps, much like an email system. Users registered on the A server are free to pay attention to another user registered on the B server, send TOOT @ he, and get a reply and notification in time.

### Choose a server
Before you want to join Mastodon, you must first select a server to register and log in. You can join different servers according to your preferences (each server evolves into a different community culture according to the builder's wishes). All servers are listed [here](https://joinmastodon.org/). Of course, you can also build your own server. To build your own server, please refer to [github](https://github.com/tootsuite/documentation#running-mastodon).

### Register and Login
After selecting the server, you will be prompted to jump to the login page. If you don't have an account yet, just log in to complete the registration! (Account information is not shared on different servers, but you can browse to other servers or add friends)

OK！just fine～

## Preview
### iOS

| ![](./screenshot/iOS/pic_1.png) | ![](./screenshot/iOS/pic_2.png) |![](./screenshot/iOS/pic_3.png)  |
|-|-|-|
|  ![](./screenshot/iOS/pic_4.png)   |   ![](./screenshot/iOS/pic_5.png)   |   ![](./screenshot/iOS/pic_6.png)   |

### Android

| ![](./screenshot/Android/pic_1.png) | ![](./screenshot/Android/pic_2.png) |![](./screenshot/Android/pic_3.png)  |
|-|-|-|
|  ![](./screenshot/Android/pic_4.png)   |   ![](./screenshot/Android/pic_5.png)   |   ![](./screenshot/Android/pic_6.png)   |


## Open source components used
 

| components  | version         | description     |
| -------- | ------------------------- | -------- |
| dio     | ^2.0.2     | Network request framework     |
| json_serializable      | ^2.0.0      | Json analysis  |
| cached_network_image    | ^0.6.0    | Network image cache     |
| shared_preferences   | ^0.5.1+1   | LocalStorage     |
| flutter_spinkit  | ^3.1.0  | Loading     |
| fluttertoast | ^3.0.1 | Totast     |
| flutter_webview_plugin    | ^0.3.0+2    | WebView     |
| flutter_html   | ^0.9.4   | Html analysis     |
| url_launcher   | ^5.0.2   | Open browser    |


## License
[MIT](./LICENSE)
