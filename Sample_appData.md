#Examples for writing and reading appData using Opensocial api.

# Example of update appData #

```

    private function updateData():void
    {
    	var dr:DataRequest = container.newDataRequest();
    	dr.add(dr.newUpdatePersonAppDataRequest("VIEWER", "testdatakey1", 'test'));
    	dr.send(updatePersonAppDataCallback);
    }
      
	private function updatePersonAppDataCallback(dataResp:DataResponse):void 
	{
		Alert.show("updatePersonAppDataCallback().  \n dataResp.hadError()=" + dataResp.hadError() 
		+ "\n dataResp.getErrorMessage()=" + dataResp.getErrorMessage());
		
	}

```

# Examples of fetch appData #

```
        private function fetchData():void
	{
		var dr:DataRequest = container.newDataRequest();
		//var idSpec:IdSpec = container.newIdSpec({ com.nextgenapp.opensocial.IdSpec.Field.USER_ID : "VIEWER"});   // does not work.  has compile error.
		//var idSpec:IdSpec = container.newIdSpec({ "USER_ID" : "VIEWER"}); // do this instead.
		var idSpecParam:Object = {};
		idSpecParam[com.nextgenapp.opensocial.IdSpec.Field.USER_ID] = "VIEWER";
		var idSpec:IdSpec = container.newIdSpec(idSpecParam);
    	dr.add(dr.newFetchPersonAppDataRequest(idSpec, ["testdatakey1"], null), opt_key); 
    	dr.send(fetchPersonAppDataCallback); 
	}
	private function fetchPersonAppDataCallback(dataResp:DataResponse):void 
	{
		trace("fetchPersonAppDataCallback()");
		Alert.show("fetchPersonAppDataCallback()");
		if (dataResp.hadError()) {
			Alert.show("error: " + dataResp.getErrorMessage());
		}
		
		var appData:Object = dataResp.get(opt_key).getData();
		Alert.show("appData=" + appData);
		
		// appData should have a member (user's id).  inside that, it should have a member
		
		var appDataDisplay:String = "";
		for (var propNameLevel1:String in appData) {
			appDataDisplay += ("\n" + propNameLevel1 + " : " + appData[propNameLevel1]);
			for (var propNameLevel2:String in appData[propNameLevel1]) {
				appDataDisplay += ("\n----" + propNameLevel2 + " : " + appData[propNameLevel1][propNameLevel2]);
			}
		}
		
		Alert.show("appData expanded=" + appDataDisplay);
	}

```


A full sample code can be found here: http://opensocial-tutorial-trial.googlecode.com/svn/trunk/os-as-lib-081-test/src/AppDataExampleOrkut.mxml