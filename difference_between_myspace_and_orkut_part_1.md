# Difference between MySpace and Orkut – part 1 #

We implement the MySpace newFetchPersonRequest() first.  Then we try to implement newFetchPersonRequest() for Orkut.  Then we found out that there are a few thing that MySpace sample code is different from the Orkut code.

The following are Javascript code.  On Actionscript side, we abstract the difference, so the Actionscript API is the same across the two containers.


## Orkut ##
```
var dataRequest = opensocial.newDataRequest();
var OWNERReq = dataRequest.newFetchPersonRequest(oParam.view, param);
dataRequest.add(OWNERReq, 'viewer');
```


## MySpace ##
```
var os = opensocial.Container.get(); // different from standard
var dataRequest = os.newDataRequest();
var OWNERReq = os.newFetchPersonRequest(oParam.view, param);
dataRequest.add(OWNERReq); // different from standard, does not require the extra name.
```