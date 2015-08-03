The overall of this library's structure is:
  * /doc: doc generated from source files by AS-Doc
  * /external: 3rd party libraries, has been compiled into swc format, including as3corelib, flexunit, jsunit, etc.
  * /sample: the sample code using this OpenSocial AS3 lib
  * /src: source code of this lib, will be covered in the later section.
  * /test: unit tests using FlexUnit

The source code of this lib (/src) includes:
  * /base: the base structures defined for the OpenSocial lib, including People/Activity/Address, etc.
  * /core: the declaration and implementation of core class OpenSocialClient, which holds the same concept as it in OpenSocial Java client.
  * /feature: implementation of event model.  As we all known, one of the major enhancement from AS2 to AS3 is its development model transferring from callback-driven to event-driven.  From AS3's official docs, we could find a clear coding pattern as:
```
var reqObj:RequestObject = new RequestObject();
reqObj.addEventListener(Event.EVENT_TYPE, handler);
reqObj.addEventListener(Event.EVENT_TYPE2, handler2);
var reqParam:RequestParameter = new RequestParameter();  // or created from
factory method
reqObj.setParam(reqParam);
reqObj.send(moreParam);
```
> Thus we follow this design principle in our client library.
  * /jswrapper and restful: These 2 dirs contains the implementation of OpenSocialClient API using JavaScript wrapper and pure RESTful connection, respectively.  Please note that the restful part hasn't been finished yet.
  * /util: It contains some handy tools for both gadget developers and us. =) Including logger and printers.