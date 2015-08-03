### Sample Usage for this ActionScript3 client ###

**ActionScript3's sample usage: URLLoader**
```
import flash.events.*;
import flash.net.*;
var loader:URLLoader = new URLLoader();
loader.addEventListener(Event.COMPLETE, completeHandler);
loader.addEventListener(Event.OPEN, openHandler);
var request:URLRequest = new URLRequest("urlLoaderExample.txt");
try {
    loader.load(request);
} catch (error:Error) {
    trace("Unable to load requested document.");
}
```

**ActionScript3's sample usage: Sprite**
```
import flash.display.Sprite;
import flash.events.*;
var sprite:Sprite = Sprite(event.target);
sprite.addEventListener(MouseEvent.MOUSE_MOVE, mouseMoveHandler);
sprite.startDrag();
```

From the above official samples copied from Adobe's language reference, we could summarize As3's typical developing model as following:
```
var reqObj:RequestObject = new RequestObject();
reqObj.addEventListener(Event.EVENT_TYPE, handler);
reqObj.addEventListener(Event.EVENT_TYPE2, handler2);
var reqParam:RequestParameter = new RequestParameter();  // or created from factory method
reqObj.setParam(reqParam);
reqObj.send(moreParam);
```

Therefore, we propose this AS3 client library works as:
```
/**
 * Initialize OpenSocial clients.
 */
var jsClient:OpenSocialClient = new JsWrapperClient(...);
...  // configure client

var restfulClient:OpenSocialClient = new RestfulClient(...);
...  // configure client

/**
 * OpenSocial data requests, which includes people.get / appdata.update / makerequest, etc.
 */
var peopleRequest:OpenSocialDataRequest =
    new OpenSocialDataRequest(Feature.FETCH_PEOPLE);  // specify the request type
var params = OpenSocialDataRequest.getFetchPeopleParams(idSpec, param);  // specify the parameters

// registers handlers and (possible) callback functions.
peopleRequest.addEventListener(Event.COMPLETE, handler);  // Ordinary event model
peopleRequest.addComplete(callback_function);  // Possible callback style

// a special case for paging, need to use Event here.
peopleRequest.addEventListener(Event.COMPLETE, function paging(event:OpenSocialDataEvent):void {
  var resp:RequestItem = event.response;
  var peopleRequest:OpenSocialDataRequest = event.currentTarget;
  if (needsPaging(resp)) {
    // Specify more parameters in the original Request object and fire it.
    // This case is very useful givn some logical components (handlers) have already listening the
    // Request object, and they don't bother to register on a new created object.
    peopleRequest.setArgs(idSpec, ... the_next_page);
    peopleRequest.send(jsClient);  // or, peopleRequest.send(resfulClient);
  }
});

// execute
peopleRequest.send(jsClient);  // or, peopleRequest.send(resfulClient);

// kinda hacky way (currying style): compacts all stuffs in one line with callback function.
// A dummy object refers to the created data request object in order to avoid auto garbage-collection.
var dummy:OpenSocialDataRequest = new OpenSocialDataRequest(OpenSocialDataRequest.FETCH_PEOPLE).setArgs(... args).addComplete(callback).send(jsClient);

/**
 * Inter-frame RPC request.
 */
var rpcRequest:RpcRequest = new RpcRequest(RpcRequest.RPC);  // specify the request type
rpcRequest.setArgs(... args);  // specify the parameters

// registers handlers and (possible) callback functions.
rpcRequest.addEventListener(Event.COMPLETE, handler);
rpcRequest.addComplete(callback_function);

// execute
rpcRequest.send(jsClient);  // rpcRequest.send(resfulClient) will trigger a run-time error since RESTful api may not support this.
```