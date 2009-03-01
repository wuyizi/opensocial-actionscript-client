/**
 * Container - opensocial container class
 * 
 * @author Aaron Tong
 */
package com.nextgenapp.opensocial
{
	import com.nextgenapp.opensocial.activity.*;
	
	import flash.system.Security;
	
	import mx.collections.XMLListCollection;
	
	public class Container implements IContainer
	{
		/**
		 * Singleton reference.
		 */		
		private static var _instance:Container = new Container();
		
		/**
		 * Sub container that opensocial container methods are delegated to. 
		 */		
		private var _container:Container;
		/**
		 * XML factory for JS injection
		 */
		protected var _xmlFactory:XMLListCollection = null;
		
		protected var _appId:String = "";
		
		/**
		 * Container constructor. 
		 * 
		 */		
		function Container()
		{
			super();
			// allow js to call actionscript methods.  without this, you may get "security sandbox violation: ExternalINterface...." when the js function is trying to call actionscript function.
			flash.system.Security.allowDomain("*"); // have to add each container, so add all for now.  change this to the container you are working on.   
			flash.system.Security.allowDomain("api.msappspace.com"); // myspace
		}
		
		/**
		 * Public singleton reference.
		 * @return Container instance.
		 * 
		 */		
		public static function get instance():Container {
			if(!_instance) 
				_instance = new Container();
			return _instance;
		}
		
		/**
		 * Checks if the delegate container has been set. 
		 * @return True if intialized, false otherwise.
		 */		
		public function isInit():Boolean {
			return _container != null;
		}
		
		/**
		 * Sets the container delegate. 
		 * @param container A subclass of opensocial.Container that opensocial container functions are delegated to.
		 * 
		 */		
		public function setContainer(container:Container):void {
			_container = container;
		}
		
		/**
		 * Gets the xml factory for this container
		 * 
		 * @return XMLCollection XMLCollection of methods for this factory
		 */
		public function get xmlFactory():XMLListCollection {
			if(_container == null) 
				throw new Error("Container delegate must be set before calling xmlFactory");
			return _container._xmlFactory;	
		}
		
		/**
		 * Gets the application id which js can use to call flash obj
		 * 
		 * @return appId the application id
		 */
		public function get appId():String {
			if(_container == null) 
				throw new Error("Container delegate must be set before calling appId");
			return _container._appId;	
		}
		
		/// IContainer Functions
		
		/**
		 * Gets the current container version (i.e. os 0.81, etc)
		 * @return String current opensocial version of container (i.e. from VersionInfo)
		 */
		public function getCurrentVersion():String {
			return VersionInfo.VERSION_0_81;
		}
		
		/**
		 * Gets the current environment for this gadget. You can use the environment to make queries such as what profile fields and surfaces are supported by this container, what parameters were passed to the current gadget, and so on.
		 * @return The current environment.
		 * 
		 */		
		public function getEnvironment():Environment {
			if(_container == null) 
				throw new Error("Container delegate must be set before calling makeRequest");
			return _container.getEnvironment();	
		}
		
		/**
		 * Returns true if the current gadget has access to the specified permission. 
		 * @param permission The permission.
		 * @return True if the gadget has access for the permission; false if it doesn't.
		 * 
		 */		
		public function hasPermission(permission:Permission):Boolean {
			if(_container == null) 
				throw new Error("Container delegate must be set before calling makeRequest");
			return _container.hasPermission(permission);
		}
		
		/**
		 * Fetches content from the provided URL and feeds that content into the callback function. 
		 * @param url The URL where the content is located.
		 * @param callback The function to call with the data from the URL once it is fetched.
		 * @param optParams Additional parameters to pass to the request.
		 * 
		 */		
		public function makeRequest(url:String, callback:Function, optParams:Object = null):void {
			if(_container == null) 
				throw new Error("Container delegate must be set before calling makeRequest");
			_container.makeRequest(url, callback, optParams);
		}

		/**
		 * Creates an activity object, which represents an activity on the server. 
		 * @param optParams Any other fields that should be set on the activity object; all of the defined Fields are supported.
		 * @return The new activity object.
		 * 
		 */		
		public function newActivity(optParams:Object = null/*Map<opensocial.Activity.Field, String*/):Activity {
			if(_container == null) 
				throw new Error("Container delegate must be set before calling newActivity");
			return _container.newActivity(optParams);
		}
				
		/**
		 * Creates a data request object to use for sending and fetching data from the server.
		 * @return DataRequest The request object.
		 * */
		public function newDataRequest():DataRequest {
			if(_container == null) 
				throw new Error("Container delegate must be set before calling makeRequest");
			return _container.newDataRequest();
		}
		
		/**
		 * Creates an IdSpec object. 
		 * @param params Parameters defining the id spec
		 */
		public function newIdSpec(params:Object):IdSpec {
			if(_container == null) 
				throw new Error("Container delegate must be set before calling newIdSpec");
			return _container.newIdSpec(params);
		}
		
		/**
		 * Creates a media item. Represents images, movies, and audio. Used when creating activities on the server. 
		 * @param mimeType MIME type of the media.
		 * @param url Where the media can be found.
		 * @param opt_params Any other fields that should be set on the media item object; all of the defined Fields are supported.
		 * @return The new media item object.
		 * 
		 */
		public function newMediaItem(mimetype:String, url:String, optParams:Object = null):MediaItem {
			if(_container == null) 
				throw new Error("Container delegate must be set before calling newMediaItem");
			return _container.newMediaItem(mimetype, url, optParams);
		}
		
		/**
		 * Creates a media item associated with an activity. Represents images, movies, and audio. Used when creating activities on the server. 
		 * 
		 * @param body The main text of the message 
		 * @param opt_params Any other fields that should be set on the message object; all of the defined Fields are supported 
		 * @return Message The new message object
		 */
		 public function newMessage(body:String, optParams:Object = null):Message {
		 	if(_container == null) 
				throw new Error("Container delegate must be set before calling newMessage");
			return _container.newMessage(body, optParams);
		 }
		
		/**
		 * Creates a NavigationParameters object. 
		 * 
		 * @param param Parameters defining the navigation
		 * @return NavigationParameters
		 */
		 public function newNavigationParameters(param:Object):NavigationParameters {
		 	if(_container == null) 
				throw new Error("Container delegate must be set before calling newNavigationParameters");
			return _container.newNavigationParameters(param);
		 }
		
		/**
		 * Takes an activity and tries to create it, without waiting for the operation to complete. Optionally calls a function when the operation completes. 
		 * @param activity The activity to create.
		 * @param priority The priority for this request.
		 * @param optCallback The function to call once the request has been processed. This callback will either be called or the gadget will be reloaded from scratch.
		 * 
		 */		
		public function requestCreateActivity(activity:Activity, priority:String, optCallback:Function = null):void { 
			if(_container == null) 
				throw new Error("Container delegate must be set before calling makeRequest");
			_container.requestCreateActivity(activity, priority, optCallback);
		}
		
		/**
		 * Requests the user to grant access to the specified permissions. 
		 * @param permissions The permissions to request from the viewer.
		 * @param reason Displayed to the user as the reason why these permissions are needed.
		 * @param optCallback The function to call once the request has been processed; either this callback will be called or the gadget will be reloaded from scratch.
		 * 
		 */		
		public function requestPermission(permissions:Array, reason:String, optCallback:Function = null):void {
			if(_container == null) 
				throw new Error("Container delegate must be set before calling makeRequest");
			_container.requestPermission(permissions, reason, optCallback);
		}	
		
		/**
		 * Requests the container to send a specific message to the specified users. 
		 * @param recipients An ID, array of IDs, or a group reference; the supported keys are VIEWER, OWNER, VIEWER_FRIENDS, OWNER_FRIENDS, or a single ID within one of those groups 
		 * @param message The message to send to the specified users
		 * @param optCallback The function to call once the request has been processed; either this callback will be called or the gadget will be reloaded from scratch 
		 * @param optParams The optional parameters indicating where to send a user when a request is made, or when a request is accepted; options are of type  NavigationParameters.DestinationType
		 */
		 public function requestSendMessage(recipients:Array, message:Message, optCallback:Function = null, optParams:Object=null):void {
		 	if(_container == null) 
				throw new Error("Container delegate must be set before calling requestSendMessage");
			_container.requestSendMessage(recipients, message, optCallback, optParams);
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
		public function requestShareApp(recipients:Array, reason:Message, optCallback:Function = null, optParams:Object=null):void {
			if(_container == null) 
				throw new Error("Container delegate must be set before calling requestShareApp");
			_container.requestShareApp(recipients, reason, optCallback, optParams);
		}

	}
}