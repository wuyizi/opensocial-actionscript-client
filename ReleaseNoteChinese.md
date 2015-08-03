OpenSocial ActionScript3 客户端开发包正式发布！

在刚刚过去的6月5日，一年一度的谷歌开发者盛会Google Developer Day在北京胜利落下帷幕。在此次盛会上， 谷歌北京OpenSocial团队正式向广大ActionScript3开发人员开源发布了OpenSocial上的AS3客户端编程库。通过这个库，开发者可以在OpenSocial容器环境中，调用原生的AS3应用接口来完成小应用的开发。希望这可以大大平缓ActionScript3开发者的学习曲线并减低开发难度。该库的主页地址是：http://code.google.com/p/opensocial-as3-client

该编程库其实是过去一年来不断发展和演进的结晶。从OpenSocial初期的0.6版本开始，它就开始了设计和开发工作。经过0.7和0.8版的发展，它已经为一些早期试用者所使用，在被应用于产品原型的同时也获得了各方面的反馈意见。此次随着OpenSocial 0.81稳定版本在广大容器的广泛部署，这个编程库的整体架构也趋于稳定。在完成了大部分的编码和测试工作后，我们决定依照Apache开源许可2.0版正式将它发布出来，也欢迎整个OpenSocial和开源社区能够审核并贡献代码，让我们大家一起，对它进行完善和改进。

在此次发布中，该编程库主要包括了以下几个部分：

  * 一个较完整的OpenSocial APIs stack，囊括了除批量发送外OpenSocial 0.81版本的所有编程接口(APIs)。关于具体的函数调用方法，请参考代码文档首页。

  * 一个完整的事件驱动开发模型。早期试用者们的反馈意见指出，相较于在JavaScript中被广泛使用的回调函数注册与触发机制而言，基于事件驱动的开发模型是ActionScript3下比较常见的开发方法。具体的例子可在代码中找到，这里简述其基本使用流程：
```
// 构造请求参数
var reqOptions:XXXXRequestOptions = new XXXXRequestOptions(...).;

// 初始化请求对象
var reqObj:XXXRequest = new XXXXRequest(Feature.SOME_FEATURE,
                                        reqOptions);

// 注册事件处理句柄
reqObj.addEventListener(Event.EVENT_TYPE_1, handler_1);
reqObj.addEventListener(Event.EVENT_TYPE_2, handler_2);

// 发送
reqObj.send(client);
```
  * 一个完整的基于FlexUnit的测试框架及对核心数据结构部分的测试用例，以方便开放源代码方式的协作开发。

  * 两类例子，分别对应于Flash和Flex开发环境。下面撷取的是一个在Flash环境下获取用户资料的真实例子：
```
// 初始化Client
var client:JsWrapperClient = new JsWrapperClient();
client.addEventListener(OpenSocialClientEvent.CLIENT_READY,
                        onReady);
client.start();

// 初始化完成后，开始进行数据交互
 function onReady(event:OpenSocialEvent):void {
  // API类型1. 同步地获取OpenSocial运行环境信息
  var helper:SyncHelper = new SyncHelper(client);
  var domain:String = helper.getDomain();
  var view:String = helper.getCurrentView();

  // API类型2. 异步地获取OpenSocial远程数据信息
  // 构造请求及参数
  var req:AsyncDataRequest = new AsyncDataRequest(
       // 请求类型
       Feature.PEOPLE_GET,
       // 构造参数
       new PeopleRequestOptions()
           .setUserId("@me")
           .setGroupId("@self"));
   
    // 注册事件处理句柄
  req.addEventListener(ResponseItemEvent.COMPLETE,  
                        fetchMeEventHandler);

  // 通过Client发送请求
  req.send(client);
}

// 数据获取事件处理句柄
private function fetchMeEventHandler(event:ResponseItemEvent):void {
  var person:Person = event.response.getData();
  // 显示该用户
  drawPerson(person);
}
```
  * 在库中有一个特殊的，也是非常重要的抽象类型OpenSocialClient，所有的OpenSocial请求都由这里发出。在目前这个版本中，我们定义了它的一个参考实现JsWrapperClient——它寄生于OpenSocial容器环境下，通过调用外层的原生Javascript APIs完成功能。

以上是对OpenSocial上的ActionScript3客户端编程库的一些综合性描述，它的详细架构请参见[英文文档](http://opensocial-as3-client.googlecode.com/svn/trunk/doc/index.html)。

在现有的功能之外，该库还提供了非常优秀的扩展性，主要包括以下方面：

  * 服务器端数据获取模式的扩展。众所周知OpenSocial规范支持多种数据获取模式，其中既包括了浏览器客户端的JavaScript模式，也包括了RESTful/RPC的服务器间交互模式。未来，规范还可能支持更多的社交类数据获取方法。通过继承并实现抽象化的数据获取渠道OpenSocialClient类，您可以自由添加所需要支持的数据获取方式。目前在库中我们已经包含了一个参考实现JsWrapperClient，并希望在不久的将来提供直接与服务器交互的参考实现RestfulClient（名称待定）。这种抽象的好处是大大降低了您作为用户从一个Client转移到另一个Client上的成本——除了对于Client初始化的少量修改外，您的后续处理代码可以无差别的继续沿用。这也将有助于浏览器端Flash和桌面AIR项目间共享功能性代码。

  * 不同OpenSocial容器间支持功能的扩展。在不同的OpenSocial平台上，彼此的功能提供上可能会有些许的差别，如有的平台提供了用户视频的管理而另一些并没有。通过继承对应的JsWrapperClient或者是其他的Client，并改写Feature Book部分，您就可以根据容器的不同量体裁衣，在自由删补所需要功能的同时保持整体架构的稳定。

  * 不同OpenSocial容器间数据结构的扩展。同样的功能在不同的OpenSocial平台上也可能由于数据存储结构的不同而有所差别，如有的平台Person对象中包含了视频域而另一些则没有。对于JsWrapperClient，它会调用JS接口自动地发掘数据存储结构中的属性。我们也期望在其他类型的Client上也能以相应的技术来实现数据域的扩展自适应。

如果您关于该库有更多疑问或建议，或是想直接参与到项目的开发过程中来，请访问[主页](http://code.google.com/p/opensocial-as3-client)与我们联系。我们期待您的参与和反馈，谢谢！