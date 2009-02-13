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
			function(flashName, idSpec, keys, opt_params)
			{	
				const KEY_DATA = 'data';
				
				function updatePersonAppData(flashName, idSpec, keys, opt_params){
					var dataRequest = opensocial.newDataRequest();
	          		dataRequest.add(req.newFetchPersonAppDataRequest(idSpec, keys, opt_params), KEY_DATA);
	          		dataRequest.send(getResponse);
	          		
	          		
	          		function getResponse(response)
					{
						var flashobj = document.getElementById(flashName);
						var returnData = {};
						
						// todo: handle error message
						//returnData.errorMessage = response.getErrorMessage();
						//returnData.hadError = response.hadError();
						
						var appData = response.get('data').getData();
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