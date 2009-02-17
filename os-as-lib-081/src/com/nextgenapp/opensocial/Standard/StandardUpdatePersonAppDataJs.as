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
					alert('10. id='+id+'.  key='+key+'.  value='+value);
					var dataRequest = opensocial.newDataRequest();
					alert('20');
	          		dataRequest.add(dataRequest.newUpdatePersonAppDataRequest(id, key, value));
	          		alert('30');
	          		dataRequest.send(getResponse);
	          		alert('40');
	          		
	          		function getResponse(response)
					{
						alert('100');
						var flashobj = document.getElementById(flashName);
						alert('101');
						var returnData = {};
						alert('102');
						// handle error message
						returnData.errorMessage = response.getErrorMessage();
						alert('103.  errorMessage=' + response.getErrorMessage());
						returnData.hadError = response.hadError();
						alert('104');
						
						flashobj.updatePersonAppDataRequestCallback(returnData);
						alert('108');
					}//getResponse 

			  	}//updatePersonAppData
			  	
			  	alert('1');
			  	updatePersonAppData(flashName, id, key, value);
			  	alert('2');
			}
		]]>
		</script>
		;

	}
}