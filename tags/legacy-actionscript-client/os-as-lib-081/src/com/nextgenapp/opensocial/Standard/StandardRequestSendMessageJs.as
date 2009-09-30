package com.nextgenapp.opensocial.Standard
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
					alert('1. flashName='+flashName +'.  recipients='+recipients+'.  message='+message +'.  '+opt_params);
					// convert message to an message type
					// body is mandatory field.
					var body = message[opensocial.Message.Field.BODY];
					alert('2.  body=' + body + '.  body literal=' + opensocial.Message.Field.BODY);
					
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
					
					
					alert('3');
					var messageJs = opensocial.newMessage(body, msgParams);
					// todo: implement callback and opt_params
					alert('4 messageJs=' + messageJs);
					opensocial.requestSendMessage(recipients, messageJs, getResponse); 
					alert('5');
					
					
					/**
					 * Note: response is an instance of ResponseItem, not DataResponse.  
					 */
					function getResponse(response)
					{
						alert('10');
						var flashobj = document.getElementById(flashName);
						alert('20');
						var returnData = {};
						alert('30');
						// handle error message
						returnData.errorMessage = response.getErrorMessage();
						alert('40');
						returnData.hadError = response.hadError();
						alert('50');
						returnData.errorCode = response.getErrorCode();
						alert('60.  returnData.errorCode=' + returnData.errorCode);
						
						alert('70');
						flashobj.requestSendMessageCallback(returnData);
						alert('80');
					}//getResponse 
		
		
					
/*  var params = [];
  alert('10');
  params[opensocial.Message.Field.TITLE] = 'title';
  alert('11');
  params[opensocial.Message.Field.TYPE] =
  opensocial.Message.Type.EMAIL;
  alert('12');
  
  var messageJs = opensocial.newMessage('body', params);
  alert('14');
  var recipient = "VIEWER";
  alert('15');
  opensocial.requestSendMessage(recipient, messageJs, callback);
  alert('16');
  
  function callback(data) {
	  if (data.hadError()) {
	    alert("There was a problem:" + data.getErrorCode());
	  } else {
	    output("Ok");
	  }
  };
*/



  
			  	}//requestSendMessage
			  	
			  	alert('0.1');
			  	requestSendMessage(flashName, recipients, message, opt_params);
			  	alert('0.2');
			}
		]]>
		</script>
		;

	}
}