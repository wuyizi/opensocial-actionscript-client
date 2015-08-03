#What is Application.application.id

# What is Application.application.id #
We got some question about what Application.application.id?  It is obvious to Flex users, it may not be obvious to Flash users.



Application.application.id represents the application id.
It should be the name you give to your flash object on your html page.

eg. in your html, if you specify   **id="OpenSocialExample" name="OpenSocialExample"**

```
<object id="OpenSocialExample" name="OpenSocialExample"
  type="application/x-shockwave-flash"  
  data="ExampleOrkut.swf"
  width="430" height="300">
  <param name="movie" value="ExampleOrkut.swf"/>
  <param name="quality" value="high" />
  <param name="wmode" value="transparent" />
  <param name="allowScriptAccess" value="always" />
  <param name="allowNetworking" value="all" />
</object>
```


Application.application.id should give you  **OpenSocialExample**.


# How is it Used #
We use the value when javascript is calling the actionscript callback function.  Javascript will use this value to get the flash object.  Then call actionscript callback method.  In StandardRequestSendMessageJs.xml, you should see an example of it.

```
var flashobj = document.getElementById(flashName);
...
flashobj.requestSendMessageCallback(returnData);
```