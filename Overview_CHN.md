开发包的整体架构如下：
  * /doc: 从源代码通过AS-Doc生成的文档
  * /external: 开发中使用到的第三方库，包括as3corelib, flexunit, jsunit等等。
  * /sample: 通过本开发包开发的范例应用
  * /src: 本开发包的源代码，具体内容将在下面介绍。
  * /test: 单元测试，基于FlexUnit

开发包的源代码(/src)结构如下：
  * /base: 基础数据结构，包括People/Activity/Address等
  * /core: 核心类OpenSocialClient的基本定义和实现。OpenSocialClient的概念和在OpenSocial Java客户端开发包中client的概念非常接近。
  * /features: 基于事件的异步请求处理机制。众所周知，AS3相对于AS2的一个重要改进就是从在JavaScript中被广泛使用的回调函数注册与触发机制，过渡到基于事件的异步请求处理机制。从AS3的官方文档中，我们常能看到如下的代码模式：
```
var reqObj:RequestObject = new RequestObject();
reqObj.addEventListener(Event.EVENT_TYPE, handler);
reqObj.addEventListener(Event.EVENT_TYPE2, handler2);
var reqParam:RequestParameter = new RequestParameter();  // or created from
factory method
reqObj.setParam(reqParam);
reqObj.send(moreParam);
```
> 因此我们在设计该开发包的时候也考虑了这种设计理念。
  * /jswrapper 和 /restful: 这两个目录分别包括了OpenSocialClient类的两个具体实现，即基于原生的JavaScript API的包装版本，和纯RESTful连接版本。请注意目前RESTful版本尚未实现。
  * /util: 这里有为应用开发者和我们自己(<sup>_</sup>)准备的趁手小工具，包括日志和打印功能等。