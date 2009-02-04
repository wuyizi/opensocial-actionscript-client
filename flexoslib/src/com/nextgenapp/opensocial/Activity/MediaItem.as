/**
 * MediaItem - media items for the Activity
 * 
 * @author Aaron Tong
 */
package com.nextgenapp.opensocial.Activity {
	import com.nextgenapp.opensocial.Activity.MediaItem.*;
	import com.nextgenapp.opensocial.OSResource;
	/**
	 * A media item associated with an activity. Represents images, movies, and audio. Create a MediaItem object using the opensocial.newActivityMediaItem() method. 
	 * @author Joseph Estrada
	 * 
	 */	
	public class MediaItem extends OSResource {
		public static const Type:Class = com.nextgenapp.opensocial.Activity.MediaItem.Type;
		public static const Field:Class = com.nextgenapp.opensocial.Activity.MediaItem.Field;
		
		public function MediaItem(opt_params:Array) {
			super(opt_params);
		}
	}
}