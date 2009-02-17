package com.nextgenapp.opensocial.Standard
{
	/**
	 * this class is used to house the javascript for newUpdatePersonAppDataRequest().
	 * 
	 * @author sol wu
	 */
	public class StandardUpdatePersonAppDataJs
	{
		public static var updatePersonAppDataRequest:XML =
		<script>
		<![CDATA[
			function(flashName, id, key, value)
			{
				function updatePersonAppData(flashName, id, key, value){
					var dataRequest = opensocial.newDataRequest();
	          		dataRequest.add(dataRequest.newUpdatePersonAppDataRequest(id, key, value));
	          		dataRequest.send(getResponse);
	          		
	          		function getResponse(response)
					{
						var flashobj = document.getElementById(flashName);
						var returnData = {};
						// handle error message
						returnData.errorMessage = response.getErrorMessage();
						returnData.hadError = response.hadError();
						
						flashobj.updatePersonAppDataRequestCallback(returnData);
					}//getResponse 

			  	}//updatePersonAppData
			  	
			  	updatePersonAppData(flashName, id, key, value);
			}
		]]>
		</script>
		;

	}
}