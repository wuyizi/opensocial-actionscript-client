/**
 * Activity - Opensocial activity object
 * 
 * @author Aaron Tong
 */
package com.nextgenapp.opensocial {
	import com.nextgenapp.opensocial.Activity.*;
	
	public class Activity extends OSResource {		
		
		public static const Field:Class = com.nextgenapp.opensocial.Activity.Field;
		public static const MediaItem:Class = com.nextgenapp.opensocial.Activity.MediaItem;
		
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
		public function Activity(id:String, optFields:Object = null):void {
			super(optFields);
			setField(ID, id);
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