# Fastodon

这是一个用Flutter实践的Mastodon客户端，用来总结之前所学习的Flutter相关知识。本项目涉及了自定义Widget、组件、页面跳转等常用功能，使用常见的第三方package，如dio、cached_network_image等。目标是开发一款可以兼容双平台并且投产使用的App👏

[Mastodon](https://joinmastodon.org/)是一个免费开源的去中心化的分布式微博客社交网络。Mastodon是开放源代码的、基于网络的分布式微博客软件。 后端以Ruby on Rails编写，而前端以JavaScript编写。本项目利用了其开源API实现，[开发文档在此](https://docs.joinmastodon.org/)。后续会考虑翻译该API文档。

## 下载项目
本项目由Flutter开发，首先要确保本地环境具有Flutter开发环境。如果暂未配置，可参考[中文文档](https://flutterchina.club/docs/)和[英文文档](https://flutter.dev/docs/get-started/install)

```
git clone https://github.com/mah93/Fastodon
cd ./Fastodon
flutter packages get
flutter run
```
即可成功在模拟器/真机中运行（Android与iOS均可）。

P.S.遇到任何问题可以在[issuse](https://github.com/mah93/Fastodon/issuse)中提问。
