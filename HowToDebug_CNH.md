有关调试，目前的经验是：用ExternalInterface把flex里面的变量传到!Javascript，然后在firefox+firebug的环境下，用firebug的console来调试。

我们的library里面，有个FirebugPrinter，把如何从flash里面输出log的这套功能包好了。
可以直接在SampleApp.mxml里的init()找到这几句：
```
// Create the output box for information displaying
var printer:TextFieldPrinter = new TextFieldPrinter(2, 150, 450, 350);
this.rawChildren.addChild(printer);
Logger.initialize(printer);
```
这个用的是TextFieldPrinter，把log写在flash那个文本框里。
把这几句改为：
```
var printer:FirebugPrinter = new FirebugPrinter();
Logger.initialize(printer);
```
重新编译运行，这样那些log文本就都在firebug里面显示了。

如果需要在浏览器里控制flash里面的变量，要用ExternalInterface.addCallback来开几个后门入口，然后通过firebug console里面写javascript的方式，传入一些Inspect语句，来达到运行时runtime调试flash的目的。

这个library默认开了个口，叫trace，用法如下：

  1. 在新的标签页打开iframe ，（这时firebug cosole才是处于gadgets的环境中，打开firebug dom，可以看到 opensocial, gadgets 等对象）
  1. 在console里运行这一句：  opensocial.flash.getFlash().trace("Hello")
  1. 这时sample flash里面的那个Log text field应该冒出 Hello 这么一行

trace这个后门定义在JsWrapperClient.as里的registerSystemCallbacks() 里