#Examples for publish activitiy using Opensocial api.

# Example of requestCreateActivity #

```

	private function createActivity():void {
		var params:Object = {};
		params[com.nextgenapp.opensocial.activity.Field.TITLE] = "test activitiy title";
		var activity:Activity = container.newActivity(params);
		
		container.requestCreateActivity(activity, com.nextgenapp.opensocial.CreateActivityPriority.HIGH, createActivityCallback);
	}
	private function createActivityCallback(respItem:ResponseItem):void 
	{
		// note: requestSendMessage() returns ResponseItem, not DataResponse.  
		trace("createActivityCallback");
		Alert.show("createActivityCallback.  haderror=" + respItem.hadError());
		if (respItem.hadError()) {
			// get the response item
			Alert.show("createActivityCallback.  errorCode=" + respItem.getErrorCode() + ".  errorMessage=" + respItem.getErrorMessage());
			
			if ("forbidden" == respItem.getErrorCode()) {
				Alert.show("user denied permission.  you have to ask user for permission.");
			}
		}
	}


```


A full sample code can be found here: http://opensocial-tutorial-trial.googlecode.com/svn/trunk/os-as-lib-081-test/src/ActivityExampleOrkut.mxml