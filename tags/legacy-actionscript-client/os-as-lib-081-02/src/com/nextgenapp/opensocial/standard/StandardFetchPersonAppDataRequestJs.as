package com.nextgenapp.opensocial.standard
{
	/**
	 * this class is used to house the javascript for newFetchPersonAppDataRequest().
	 * http://wiki.opensocial.org/index.php?title=Opensocial.DataRequest_(v0.8)#newFetchPersonAppDataRequest
	 * 
	 * @author sol wu & aaron tong
	 */
	public class StandardFetchPersonAppDataRequestJs
	{
		public static var fetchPersonAppDataRequest:XML =
		<script>
		<![CDATA[
			function(flashName, opt_key, idSpec, keys, opt_params)
			{					
				function updatePersonAppData(flashName, idSpec, keys, opt_params){					
					var dataRequest = opensocial.newDataRequest();
					var idSpecJsParam = {};
					
					if (idSpec['USER_ID']) {
						idSpecJsParam[opensocial.IdSpec.Field.USER_ID] = idSpec['USER_ID'];
					}
					if (idSpec['GROUP_ID']) {
						idSpecJsParam[opensocial.IdSpec.Field.GROUP_ID] = idSpec['GROUP_ID'];
					}
					
					//var idSpecJs = opensocial.newIdSpec({ "userId" : "OWNER", "groupId" : "FRIENDS" });
					var idSpecJs = opensocial.newIdSpec(idSpecJsParam);
					var fpadReq;
					if (opt_params) {
						fpadReq = dataRequest.newFetchPersonAppDataRequest(idSpecJs, keys, opt_params);
					} else {
						fpadReq = dataRequest.newFetchPersonAppDataRequest(idSpecJs, keys);
					}
	          		dataRequest.add(fpadReq, opt_key);
	          		dataRequest.send(getResponse);
	          		
	          		function getResponse(response)
					{
						var flashobj = document.getElementById(flashName);
						var returnData = {};
						
						// handle error message
						returnData.errorMessage = response.getErrorMessage();
						returnData.hadError = response.hadError();
						
						var appData = response.get(opt_key).getData();
						returnData.opt_key = opt_key;
						returnData.data = appData;
						
						
						flashobj.fetchPersonAppDataRequestCallback(returnData);
					} 
			  	}//updatePersonAppData
			  	
			  	updatePersonAppData(flashName, idSpec, keys, opt_params);
			}
		]]>
		</script>
		;

	}
}