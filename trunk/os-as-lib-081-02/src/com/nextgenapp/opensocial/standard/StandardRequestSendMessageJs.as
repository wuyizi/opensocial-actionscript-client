package com.nextgenapp.opensocial.standard
{
	/**
	 * this class is used to house the javascript for opensocial.requestSendMessage().
	 * http://wiki.opensocial.org/index.php?title=Opensocial_(v0.8)
	 * 
	 * @author sol wu & aaron tong
	 */
	public class StandardRequestSendMessageJs
	{
		public static var requestSendMessage:XML =
		<script>
		<![CDATA[
			function(flashName, recipients, message, opt_params)
			{					
				function requestSendMessage(flashName, recipients, message, opt_params){
					//alert('1. flashName='+flashName +'.  recipients='+recipients+'.  message='+message +'.  '+opt_params);
					// convert message to an message type
					// body is mandatory field.
					var body = message[opensocial.Message.Field.BODY];
					//alert('2.  body=' + body + '.  body literal=' + opensocial.Message.Field.BODY);
					
					var msgParams = {};
					//msgParams[opensocial.Message.Field.TITLE] = 'title';
					//msgParams[opensocial.Message.Field.TYPE] = opensocial.Message.Type.EMAIL;
					// populate msgParams by getting it from message object
					for (var msgParamName in message) {
						// ignore BODY, because it is populated in another way.
						if (opensocial.Message.Field.BODY != msgParamName) {
							msgParams[msgParamName] = message[msgParamName];
						}
					}
					
					var escapedText = gadgets.util.escapeString(body);
					
					var messageJs = opensocial.newMessage(escapedText, msgParams);
					// todo: implement opt_params
					opensocial.requestSendMessage(recipients, messageJs, getResponse); 
					
					
					/**
					 * Note: response is an instance of ResponseItem, not DataResponse.  
					 */
					function getResponse(response)
					{
						var flashobj = document.getElementById(flashName);
						var returnData = {};
						// handle error message
						returnData.errorMessage = response.getErrorMessage();
						returnData.hadError = response.hadError();
						returnData.errorCode = response.getErrorCode();
						
						flashobj.requestSendMessageCallback(returnData);
					}//getResponse 
  
			  	}//requestSendMessage
			  	
			  	requestSendMessage(flashName, recipients, message, opt_params);
			}
		]]>
		</script>
		;

	}
}