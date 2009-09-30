package com.nextgenapp.opensocial.standard
{
	
	/**
	 * this class is used to house the javascript for opensocial.requestCreateActivity().
	 * http://wiki.opensocial.org/index.php?title=Opensocial_(v0.8)
	 * 
	 * example javascript code.
	 * function postActivity(nut, friend) {
		  var title = 'gave ' + globalFriends.getById(friend).getDisplayName() + ' ' + globalGiftList[nut];
		  var params = {};
		  params[opensocial.Activity.Field.TITLE] = title;
		  var activity = opensocial.newActivity(params)
		  opensocial.requestCreateActivity(activity, opensocial.CreateActivityPriority.HIGH, function() {});
		}
	 * 
	 * @author sol wu & aaron tong
	 */
	public class StandardRequestCreateActivityJs
	{
		public static var requestCreateActivity:XML =
		<script>
		<![CDATA[
			function(flashName, activity, priority)
			{					
				function requestCreateActivity(flashName, activity, priority){
					var activityJs = opensocial.newActivity(activity);
					opensocial.requestCreateActivity(activityJs, priority, getResponse);
					
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
						
						flashobj.requestCreateActivityCallback(returnData);
					}//getResponse 
  
			  	}//requestCreateActivity
			  	
			  	requestCreateActivity(flashName, activity, priority);
			}
		]]>
		</script>
		;
		
	}
}