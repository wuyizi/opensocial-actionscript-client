/**
 * Activity - Opensocial activity object
 * 
 * @author Aaron Tong & sol wu
 */
package com.nextgenapp.opensocial {
	import com.nextgenapp.opensocial.activity.*;
	
	public class Activity extends OSResource {		
		
		public static var Field:Class = com.nextgenapp.opensocial.activity.Field;
		public static var MediaItem:Class = com.nextgenapp.opensocial.activity.MediaItem;
		
		/**
		 * ID key. 
		 */		
		private const ID:String = "ID" + Math.floor(Math.random() * 10000);
		
		/**
		 * Activity constructor. 
		 * @param id Activity id.
		 * @param optFields Optional field set for activity.
		 * 
		 */		
		public function Activity(optFields:Object = null):void {
			super(optFields);
		}
		
		/**
		 * Gets an ID that can be permanently associated with this activity. 
		 * @return 
		 * 
		 */		
		public function getId():String {
			return getField(ID) as String;
		}
	}
}