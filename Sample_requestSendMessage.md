#Sample Code for requestSendMessage().

# Sample Code for requestSendMessage() #

```
var msgParams:Object = {};
msgParams[com.nextgenapp.opensocial.Message.Field.TITLE] = 'test title';
msgParams[com.nextgenapp.opensocial.Message.Field.TYPE] = com.nextgenapp.opensocial.Message.Type.EMAIL;

var message:Message = container.newMessage("test msg body", msgParams);
container.requestSendMessage(["VIEWER"], message);
```


# Sample Code for requestSendMessage() with callback #

```
    private function sendEmail():void
    {
    	var msgParams:Object = {};
		msgParams[com.nextgenapp.opensocial.Message.Field.TITLE] = 'test title';
		msgParams[com.nextgenapp.opensocial.Message.Field.TYPE] = com.nextgenapp.opensocial.Message.Type.EMAIL;
    	
    	var message:Message = container.newMessage("test msg body", msgParams);
    	container.requestSendMessage(["VIEWER"], message, sendEmailCallback);
    }      
	private function sendEmailCallback(respItem:ResponseItem):void 
	{
		// note: requestSendMessage() returns ResponseItem, not DataResponse.  
		trace("sendEmailCallback");
		Alert.show("sendEmailCallback.  haderror=" + respItem.hadError());
		if (respItem.hadError()) {
			// get the response item
			Alert.show("sendEmailCallback.  errorCode=" + respItem.getErrorCode() + ".  errorMessage=" + respItem.getErrorMessage());
		}
	}

```

A full sample code can be found here: http://opensocial-tutorial-trial.googlecode.com/svn/trunk/os-as-lib-081-test/src/SendMsgExampleOrkut.mxml