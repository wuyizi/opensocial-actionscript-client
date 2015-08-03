#Development Notes

# Here are some notes explaining the library's internal architecture #

For each of the OpenSocial API call, we basically do:
1. register the callback function on Actionscript side
2. register the callback function for js to call as.
3. use ExternalInterface to call the javascript function

eg.
```
StandardCallback.register(StandardCallback.REQUEST_CREATE_ACTIVITY, optCallback);
//Add the callback
ExternalInterface.addCallback("requestCreateActivityCallback", StandardCallback.requestCreateActivityCallback);
			
// convert message from Message object to generic object.
ExternalInterface.call(StandardRequestCreateActivityJs.requestCreateActivity, ExternalInterface.objectID, activity.write(), priority);
```

Our javascript function is dynamically generated and injected into dom tree.
We employ a trick to maintain some reasonable formatting of the javascript: placing javascript inside the mxml (or .as files) as XML.