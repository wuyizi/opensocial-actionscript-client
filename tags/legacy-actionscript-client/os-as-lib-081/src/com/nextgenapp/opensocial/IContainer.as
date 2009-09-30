/**
 * IContainer - Interface to opensocial container
 * 
 * @author Aaron Tong
 */
package com.nextgenapp.opensocial
{
	import com.nextgenapp.opensocial.Activity.MediaItem;
	
	public interface IContainer
	{
		
		/**
		 * Gets the current container version (i.e. os 0.81, etc)
		 * @return String current opensocial version of container (i.e. from VersionInfo)
		 */
		function getCurrentVersion():String;
		
		/**
		 * Gets the current environment for this gadget.
		 */		
		function getEnvironment():Environment;
		
		/**
		 * Returns true if the current gadget has access to the specified permission. 
		 * @param permission The permission.
		 * @return True if the gadget has access for the permission; false if it doesn't.
		 * 
		 */		
		function hasPermission(permission:Permission):Boolean;
				
		/**
		 * Creates an activity object, which represents an activity on the server. 
		 * @param optParams Any other fields that should be set on the activity object; all of the defined Fields are supported.
		 * @return The new activity object.
		 * 
		 */		
		function newActivity(optParams:Object = null):Activity;
		
		/**
		 * Creates a data request object to use for sending and fetching data from the server.
		 * @return DataRequest The request object.
		 * */
		function newDataRequest():DataRequest;

		/**
		 * Creates an IdSpec object. 
		 * @param params Parameters defining the id spec
		 */
		function newIdSpec(params:Object):IdSpec;

		/**
		 * Creates a media item. Represents images, movies, and audio. Used when creating activities on the server. 
		 * @param mimeType MIME type of the media.
		 * @param url Where the media can be found.
		 * @param opt_params Any other fields that should be set on the media item object; all of the defined Fields are supported.
		 * @return The new media item object.
		 * 
		 */
		function newMediaItem(mimetype:String, url:String, optParams:Object = null):MediaItem;
		
		/**
		 * Creates a media item associated with an activity. Represents images, movies, and audio. Used when creating activities on the server. 
		 * 
		 * @param body The main text of the message 
		 * @param opt_params Any other fields that should be set on the message object; all of the defined Fields are supported 
		 * @return Message The new message object
		 */
		 function newMessage(body:String, optParams:Object = null):Message;
		
		/**
		 * Creates a NavigationParameters object. 
		 * 
		 * @param param Parameters defining the navigation
		 * @return NavigationParameters
		 */
		 function newNavigationParameters(param:Object):NavigationParameters;
		  				
		/**
		 * Takes an activity and tries to create it, without waiting for the operation to complete. Optionally calls a function when the operation completes. 
		 * @param activity The activity to create.
		 * @param priority The priority for this request.
		 * @param optCallback The function to call once the request has been processed. This callback will either be called or the gadget will be reloaded from scratch.
		 * 
		 */
		function requestCreateActivity(activity:Activity, priority:String, optCallback:Function = null):void;
		
		
		/**
		 * Requests the user to grant access to the specified permissions. 
		 * @param permissions The permissions to request from the viewer.
		 * @param reason Displayed to the user as the reason why these permissions are needed.
		 * @param optCallback The function to call once the request has been processed; either this callback will be called or the gadget will be reloaded from scratch.
		 * 
		 */	
		function requestPermission(permissions:Array, reason:String, optCallback:Function = null):void;
		
		/**
		 * Requests the container to send a specific message to the specified users. 
		 * @param recipients An ID, array of IDs, or a group reference; the supported keys are VIEWER, OWNER, VIEWER_FRIENDS, OWNER_FRIENDS, or a single ID within one of those groups 
		 * @param message The message to send to the specified users
		 * @param optCallback The function to call once the request has been processed; either this callback will be called or the gadget will be reloaded from scratch 
		 * @param optParams The optional parameters indicating where to send a user when a request is made, or when a request is accepted; options are of type  NavigationParameters.DestinationType
		 */
		 function requestSendMessage(recipients:Array, message:Message, optCallback:Function = null, optParam:Object=null):void;
	}
}