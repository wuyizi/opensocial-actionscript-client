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
					// body is required.
					var body = message.BODY;
					alert('2.  body=' + body);
					
					var msgParams = {};
					msgParams[opensocial.Message.Field.TITLE] = 'title';
					msgParams[opensocial.Message.Field.TYPE] = opensocial.Message.Type.EMAIL;
					// todo: implement msgParams by getting it from message object
					//for (var msgParamName in message) {
					//  // find the correct parameter name.
					//	msgParams[msgParamName] = message[msgParamName];
					//}
					
					
					alert('3');
					var messageJs = opensocial.newMessage(body, msgParams);
					// todo: implement callback and opt_params
					alert('4 messageJs=' + messageJs);
					opensocial.requestSendMessage(recipients, messageJs); 
					alert('5');
		
		
					
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