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
			function(id, key, value)
			{	
				function updatePersonAppData(id, key, value){
					var dataRequest = opensocial.newDataRequest();
	          		dataRequest.add(req.newUpdatePersonAppDataRequest(id, key, value));
	          		dataRequest.send(); // no callback
			  	}//updatePersonAppData
			  	
			  	updatePersonAppData(id, key, value);
			}
		]]>
		</script>
		;

	}
}