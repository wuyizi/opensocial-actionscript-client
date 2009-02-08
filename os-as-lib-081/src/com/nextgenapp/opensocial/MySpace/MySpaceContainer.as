/**
 * MySpaceContainer - MySpace implementation of the Container
 *
 * @author Aaron Tong
 */
package com.nextgenapp.opensocial.MySpace
{
	import mx.core.Application;
	import com.nextgenapp.opensocial.Activity.*;
	import com.nextgenapp.opensocial.*;
	
	import flash.external.ExternalInterface;

	public class MySpaceContainer extends Container
	{

		public function MySpaceContainer()
		{
			//initailize the application id
			this._appId = Application.application.id;
			//initialize the xml factory
			this._xmlFactory = new MySpaceXMLOS();
			//initialize the javascript lib persistent functions
			ExternalInterface.call(MySpaceXMLOS(this._xmlFactory).init);
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
		 * @param optParams Any other fields that should be set on the activity object; all of the defined Fields are supported.
		 * @return The new activity object.
		 * 
		 */		
		override public function newActivity(optParams:Object = null/*Map<opensocial.Activity.Field, String*/):Activity {
			throw new Error("method not implemented!");
		}
				
		/**
		 * Creates a data request object to use for sending and fetching data from the server.
		 * @return DataRequest The request object.
		 * */
		override public function newDataRequest():DataRequest {
			return new MySpaceDataRequest();
		}
		
		/**
		 * Creates an IdSpec object. 
		 * @param params Parameters defining the id spec
		 */
		override public function newIdSpec():IdSpec {
			throw new Error("method not implemented!");
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
			throw new Error("method not implemented!");
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
		 * @param activity The activity to create.
		 * @param priority The priority for this request.
		 * @param optCallback The function to call once the request has been processed. This callback will either be called or the gadget will be reloaded from scratch.
		 * 
		 */		
		override public function requestCreateActivity(activity:Activity, priority:String, optCallback:Function = null):void { 
			throw new Error("method not implemented!");
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
		 * @param optParams The optional parameters indicating where to send a user when a request is made, or when a request is accepted; options are of type  NavigationParameters.DestinationType
		 */
		 override public function requestSendMessage(recipients:Array, message:String, optCallback:Function = null, optParam:Object=null):void {
			throw new Error("method not implemented!");
		 }
	}
}