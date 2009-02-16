package com.nextgenapp.opensocial.Standard
{
	/**
	 * this class is used to house the javascript for newFetchPersonAppDataRequest().
	 * http://wiki.opensocial.org/index.php?title=Opensocial.DataRequest_(v0.8)#newFetchPersonAppDataRequest
	 * 
	 * @author sol wu
	 */
	public class StandardFetchPersonAppDataRequestJs
	{
		public static var fetchPersonAppDataRequest:XML =
		<script>
		<![CDATA[
			function(flashName, opt_key, idSpec, keys, opt_params)
			{					
				function updatePersonAppData(flashName, idSpec, keys, opt_params){
					for (var tempPropName in idSpec) {
						alert(tempPropName + "=" + idSpec[tempPropName]);
					}
					
					for each (var tempKey in keys) {
						alert(tempKey);
					}
					
					alert('1');
					var dataRequest = opensocial.newDataRequest();
					var idSpecJsParam = {};
					
					alert('2');
					if (idSpec['USER_ID']) {
						alert('3');
						idSpecJsParam[opensocial.IdSpec.Field.USER_ID] = idSpec['USER_ID'];
						alert('4');
					}
					if (idSpec['GROUP_ID']) {
						alert('5');
						idSpecJsParam[opensocial.IdSpec.Field.GROUP_ID] = idSpec['GROUP_ID'];
						alert('6');
					}
					
					//var idSpecJs = opensocial.newIdSpec({ "userId" : "OWNER", "groupId" : "FRIENDS" });
					var idSpecJs = opensocial.newIdSpec(idSpecJsParam);
					var fpadReq;
					alert('7');
					if (opt_params) {
						fpadReq = dataRequest.newFetchPersonAppDataRequest(idSpecJs, keys, opt_params);
					} else {
						fpadReq = dataRequest.newFetchPersonAppDataRequest(idSpecJs, keys);
					}
					alert('7.5');
	          		dataRequest.add(fpadReq, opt_key);
	          		alert('8');
	          		dataRequest.send(getResponse);
	          		alert('9');
	          		
	          		function getResponse(response)
					{
						alert('100');
						var flashobj = document.getElementById(flashName);
						alert('101');
						var returnData = {};
						
						// todo: handle error message
						//returnData.errorMessage = response.getErrorMessage();
						//returnData.hadError = response.hadError();
						
						alert('105');
						var appData = response.get(opt_key).getData();
						alert('106. appData=' + appData + ".  typeof()" + typeof(appData));
						returnData.opt_key = opt_key;
						alert('106.5 appData=' + appData + ".  typeof()" + typeof(appData));
						returnData.data = appData;
						alert('107');
						
						
						flashobj.fetchPersonAppDataRequestCallback(returnData);
						alert('108');
					} 
			  	}//updatePersonAppData
			  	
			  	updatePersonAppData(flashName, idSpec, keys, opt_params);
			}
		]]>
		</script>
		;

	}
}