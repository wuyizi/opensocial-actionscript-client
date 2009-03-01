package com.nextgenapp.opensocial.standard
{
	/**
	 * this class is used to house the javascript for opensocial.requestShareApp().
	 * http://code.google.com/apis/opensocial/docs/0.8/reference/#opensocial.requestShareApp
	 * 
	 * @author sol wu & aaron tong
	 */
	public class StandardRequestShareAppJs
	{
		public static var requestShareApp:XML =
		<script>
		<![CDATA[
			function(flashName, recipients, reason, opt_params)
			{					
				function requestShareApp(flashName, recipients, reason, opt_params){
					alert('1. flashName='+flashName +'.  recipients='+recipients+'.  reason='+reason +'.  '+opt_params);
					// convert reason to an Message type
					// body is mandatory field.
					var body = reason[opensocial.Message.Field.BODY];
					alert('2.  body=' + body);
					
					var msgParams = {};
					// populate msgParams by getting it from reason object
					for (var msgParamName in reason) {
						alert('3 msgParamName=' + msgParamName + '=  ' + reason[msgParamName]);
						// ignore BODY, because it is populated in another way.
						if (opensocial.Message.Field.BODY != msgParamName) {
							msgParams[msgParamName] = reason[msgParamName];
							alert('4 msgParamName=' + msgParamName + '=  ' + msgParams[msgParamName]);
						}
					}
					
					alert('5');
					var escapedText = gadgets.util.escapeString(body);
					
					alert('6');
					var reasonJs = opensocial.newMessage(escapedText, msgParams);
					alert('7');
					// todo: implement the optional parameters
					opensocial.requestShareApp(recipients, reasonJs, getResponse);
					alert('8');
					
					
					/**
					 * Note: response is an instance of ResponseItem, not DataResponse.  
					 */
					function getResponse(response)
					{
						alert('10');
						var flashobj = document.getElementById(flashName);
						var returnData = {};
						// handle error message
						returnData.errorMessage = response.getErrorMessage();
						returnData.hadError = response.hadError();
						returnData.errorCode = response.getErrorCode();
						
						alert('11');
						flashobj.requestShareAppCallback(returnData);
						alert('20');
					}//getResponse 
  
			  	}//requestShareApp
			  	
			  	requestShareApp(flashName, recipients, reason, opt_params);
			}
		]]>
		</script>
		;

	}
}