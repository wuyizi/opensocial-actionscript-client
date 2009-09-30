/**
 * standard implementation of the Container.  conform to 0.8 standard.
 *
 * @author Aaron Tong & sol wu
 */
package com.nextgenapp.opensocial.standard
{
	import com.nextgenapp.opensocial.*;
	import com.nextgenapp.opensocial.activity.*;
	
	import flash.external.ExternalInterface;
	
	import mx.core.Application;

	public class StandardContainer extends Container
	{

		public function StandardContainer()
		{
			//check and make sure external interface is available
			if(!ExternalInterface.available) {
				throw new Error("*** Cannot intialize StandardContainer as flash ExternalInterface is not available.");
			}
			//initailize the application id
			this._appId = Application.application.id;
			//initialize the xml factory
			this._xmlFactory = new StandardXMLOS();
			trace("*** xml init: " + StandardXMLOS(this._xmlFactory).init);
			//initialize the javascript lib persistent functions
			ExternalInterface.call(StandardXMLOS(this._xmlFactory).init);
		}
		
		/**
		 * Gets the current environment for this gadget. You can use the environment to make queries such as what profile fields and surfaces are supported by this container, what parameters were passed to the current gadget, and so on.
		 * @return The current environment.
		 * 
		 */		
		override public function getEnvironment():Environment {
			throw new Error("method not implemented!");
		}
		
		/**
		 * Returns true if the current gadget has access to the specified permission. 
		 * @param permission The permission.
		 * @return True if the gadget has access for the permission; false if it doesn't.
		 * 
		 */		
		override public function hasPermission(permission:Permission):Boolean {
			throw new Error("method not implemented!");
		}
		
		/**
		 * Fetches content from the provided URL and feeds that content into the callback function. 
		 * @param url The URL where the content is located.
		 * @param callback The function to call with the data from the URL once it is fetched.
		 * @param optParams Additional parameters to pass to the request.
		 * 
		 */		
		override public function makeRequest(url:String, callback:Function, optParams:Object = null /*Map<opensocial.ContentReqeustParameters, String>*/):void {
			throw new Error("method not implemented!");
		}

		/**
		 * Creates an activity object, which represents an activity on the server.
		 * 
		 * It is only required to set one of TITLE_ID or TITLE. In addition, if you are using any variables in your title or title template, you must set TEMPLATE_PARAMS.
		 * Other possible fields to set are: URL, MEDIA_ITEMS, BODY_ID, BODY, EXTERNAL_ID, PRIORITY, STREAM_TITLE, STREAM_URL, STREAM_SOURCE_URL, and STREAM_FAVICON_URL.
		 * Containers are only required to use TITLE_ID or TITLE, and may choose to ignore additional parameters.
		 * See Field for more details.
		 *
		 * Creates an activity object, which represents an activity on the server. 
		 * @param optParams Any other fields that should be set on the activity object; all of the defined Fields are supported.
		 * @return The new activity object.
		 * 
		 * @see requestCreateActivity()
		 */		
		override public function newActivity(params:Object = null/*Map<opensocial.Activity.Field, String*/):Activity {
			return new Activity(params);
		}
				
		/**
		 * Creates a data request object to use for sending and fetching data from the server.
		 * @return DataRequest The request object.
		 * */
		override public function newDataRequest():DataRequest {
			return new StandardDataRequest();
		}
		
		/**
		 * Creates an IdSpec object. 
		 * @param params Parameters defining the id spec
		 */
		override public function newIdSpec(params:Object):IdSpec {
			return new IdSpec(params[com.nextgenapp.opensocial.IdSpec.Field.USER_ID],
							  params[com.nextgenapp.opensocial.IdSpec.Field.GROUP_ID]);
		}
		
		/**
		 * Creates a media item. Represents images, movies, and audio. Used when creating activities on the server. 
		 * @param mimeType MIME type of the media.
		 * @param url Where the media can be found.
		 * @param opt_params Any other fields that should be set on the media item object; all of the defined Fields are supported.
		 * @return The new media item object.
		 * 
		 */
		override public function newMediaItem(mimetype:String, url:String, optParams:Object = null):MediaItem {
			throw new Error("method not implemented!");
		}
		
		/**
		 * Creates a media item associated with an activity. Represents images, movies, and audio. Used when creating activities on the server. 
		 * 
		 * @param body The main text of the message 
		 * @param opt_params Any other fields that should be set on the message object; all of the defined Fields are supported 
		 * @return Message The new message object
		 */
		 override public function newMessage(body:String, optParams:Object = null):Message {
			return new Message(body, optParams);
		 }
		
		/**
		 * Creates a NavigationParameters object. 
		 * 
		 * @param param Parameters defining the navigation
		 * @return NavigationParameters
		 */
		 override public function newNavigationParameters(param:Object):NavigationParameters {
			throw new Error("method not implemented!");
		 }
		
		/**
		 * Takes an activity and tries to create it, without waiting for the operation to complete. Optionally calls a function when the operation completes.
		 * @See newActivity()
		 * 
		 * Note: If this is the first activity that has been created for the user and the request is marked as HIGH priority then this call may open a user flow and navigate away from your gadget.
		 * This callback will either be called or the gadget will be reloaded from scratch. This function will be passed one parameter, an opensocial.ResponseItem. The error code will be set to reflect whether there were any problems with the request. If there was no error, the activity was created. If there was an error, you can use the response item's getErrorCode method to determine how to proceed. The data on the response item will not be set.
		 * If the container does not support this method the callback will be called with a opensocial.ResponseItem. The response item will have its error code set to NOT_IMPLEMENTED.
		 *  
		 * @param activity The activity to create.
		 * @param priority The priority for this request.
		 * @param optCallback The function to call once the request has been processed. This callback will either be called or the gadget will be reloaded from scratch.
		 * 
		 */		
		override public function requestCreateActivity(activity:Activity, priority:String, optCallback:Function = null):void { 
			//Register callback 
			StandardCallback.register(StandardCallback.REQUEST_CREATE_ACTIVITY, optCallback);
			//Add the callback
			ExternalInterface.addCallback("requestCreateActivityCallback", StandardCallback.requestCreateActivityCallback);
			
			// convert message from Message object to generic object.
			ExternalInterface.call(StandardRequestCreateActivityJs.requestCreateActivity, ExternalInterface.objectID, activity.write(), priority);
		}
		
		/**
		 * Requests the user to grant access to the specified permissions. 
		 * @param permissions The permissions to request from the viewer.
		 * @param reason Displayed to the user as the reason why these permissions are needed.
		 * @param optCallback The function to call once the request has been processed; either this callback will be called or the gadget will be reloaded from scratch.
		 * 
		 */		
		override public function requestPermission(permissions:Array, reason:String, optCallback:Function = null):void {
			throw new Error("method not implemented!");
		}	
		
		/**
		 * Requests the container to send a specific message to the specified users. 
		 * @param recipients An ID, array of IDs, or a group reference; the supported keys are VIEWER, OWNER, VIEWER_FRIENDS, OWNER_FRIENDS, or a single ID within one of those groups 
		 * @param message The message to send to the specified users
		 * @param optCallback The function to call once the request has been processed; either this callback will be called or the gadget will be reloaded from scratch 
		 * @param optParams (todo) The optional parameters indicating where to send a user when a request is made, or when a request is accepted; options are of type  NavigationParameters.DestinationType
		 */
		override public function requestSendMessage(recipients:Array, message:Message, optCallback:Function = null, optParams:Object=null):void {
			//Register callback 
			StandardCallback.register(StandardCallback.REQUEST_SEND_MESSAGE, optCallback);
			//Add the callback
			ExternalInterface.addCallback("requestSendMessageCallback", StandardCallback.requestSendMessageCallback);
			
			// convert message from Message object to generic object.
			ExternalInterface.call(StandardRequestSendMessageJs.requestSendMessage, ExternalInterface.objectID, recipients, message.write(), optParams);
		}
		
		/**
		 * Requests the container to share this gadget with the specified users.
		 * The callback function is passed one parameter, an opensocial.ResponseItem. 
		 * The error code will be set to reflect whether there were any problems with the request. 
		 * If there was no error, the sharing request was sent. 
		 * If there was an error, you can use the response item's getErrorCode method to determine how to proceed. 
		 * The data on the response item will not be set.
		 * If the container does not support this method the callback will be called with a opensocial.ResponseItem. 
		 * The response item will have its error code set to NOT_IMPLEMENTED.
		 * Parameters:
		 * @param recipients  Array.<String>, String  - An ID, array of IDs, or a group reference; the supported keys are VIEWER, OWNER, VIEWER_FRIENDS, OWNER_FRIENDS, or a single ID within one of those groups
		 * @param reason   opensocial.Message - The reason the user wants the gadget to share itself. This reason can be used by the container when prompting the user for permission to share the app. It may also be ignored.
		 * @param optCallback   Function - The function to call once the request has been processed; either this callback will be called or the gadget will be reloaded from scratch
		 * @param optParams    opensocial.NavigationParameters - The optional parameters indicating where to send a user when a request is made, or when a request is accepted; options are of type NavigationParameters.DestinationType
 		 *  
		 */
		override public function requestShareApp(recipients:Array, reason:Message, optCallback:Function = null, optParams:Object=null):void {
			//Register callback 
			StandardCallback.register(StandardCallback.REQUEST_SHARE_APP, optCallback);
			//Add the callback
			ExternalInterface.addCallback("requestShareAppCallback", StandardCallback.requestShareAppCallback);
			
			// convert message from Message object to generic object.
			ExternalInterface.call(StandardRequestShareAppJs.requestShareApp, ExternalInterface.objectID, recipients, reason.write(), optParams);
		}
	}
}