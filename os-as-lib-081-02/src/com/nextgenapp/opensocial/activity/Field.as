/**
 * Field - Fields in the activity
 * http://wiki.opensocial.org/index.php?title=Opensocial.Activity_(v0.8)
 * 
 * @author Aaron Tong & sol wu
 */
package com.nextgenapp.opensocial.activity {
	public class Field {
		/**
		 * A string specifying the application that this activity is associated with. 
		 */		
		public static const APP_ID:String = "appId";
		/**
		 * A string specifying an optional expanded version of an activity.  
		 */		
		public static const BODY:String = "body";
		/**
		 * A string specifying the body template message ID in the gadget spec. 
		 */
		public static const BODY_ID:String = "bodyId";
		/**
		 * An optional string ID generated by the posting application. 
		 */				
		public static const EXTERNAL_ID:String = "externalId";
  		/**
  		 * A string ID that is permanently associated with this activity. 
  		 */		
  		public static const ID:String = "id";
		/**
		 * Any photos, videos, or images that should be associated with the activity. 
		 */		
		public static const MEDIA_ITEMS:String = "mediaItems";
		/**
		 * A string specifying the time at which this activity took place in milliseconds since the epoch. 
		 */		
		public static const POSTED_TIME:String = "postedTime";
		/**
		 * A number between 0 and 1 representing the relative priority of this activity in relation to other activities from the same source 
		 */
		public static const PRIORITY:String = "priority";
		/**
		 * A string specifying the URL for the stream's favicon.  
		 */		
		public static const STREAM_FAVICON_URL:String = "streamFaviconUrl";
		/**
		 * A string specifying the stream's source URL. 
		 */		
		public static const STREAM_SOURCE_URL:String = "streamSourceUrl";
		/**
		 * A string specifing the title of the stream. 
		 */				
		public static const STREAM_TITLE:String = "streamTitle";
		/**
		 * A string specifying the stream's URL. 
		 */		
		public static const STREAM_URL:String = "streamUrl";
		/**
		 * A map of custom keys to values associated with this activity. 
		 */		
		public static const TEMPLATE_PARAMS:String = "templateParams";
		/**
		 * A string specifying the primary text of an activity. 
		 */		
		public static const TITLE:String = "title";
		/**
		 * A string specifying the title template message ID in the gadget spec. 
		 */		
		public static const TITLE_ID:String = "titleId";
		/**
		 * A string specifying the URL that represents this activity. 
		 */		
		public static const URL:String = "url";
		/**
		 * The string ID of the user who this activity is for. 
		 */		
		public static const USER_ID:String = "userId";
	}
}	