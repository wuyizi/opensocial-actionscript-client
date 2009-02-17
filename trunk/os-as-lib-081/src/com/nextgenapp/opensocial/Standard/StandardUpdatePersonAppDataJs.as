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
					alert('10. id='+id+'.  key='+key+'.  value='+value);
					var dataRequest = opensocial.newDataRequest();
					alert('20');
	          		dataRequest.add(dataRequest.newUpdatePersonAppDataRequest(id, key, value));
	          		alert('30');
	          		dataRequest.send(); // no callback
	          		alert('40');
			  	}//updatePersonAppData
			  	
			  	alert('1');
			  	updatePersonAppData(id, key, value);
			  	alert('2');
			}
		]]>
		</script>
		;

	}
}