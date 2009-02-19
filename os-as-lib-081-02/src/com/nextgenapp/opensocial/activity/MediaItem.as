package com.nextgenapp.opensocial.activity {
	import com.nextgenapp.opensocial.activity.mediaItem.*;
	import com.nextgenapp.opensocial.OSResource;
	
	/**
	 * MediaItem - media items for the Activity
	 * 
	 * @author Aaron Tong
	 */	
	public class MediaItem extends OSResource {
		public static const Type:Class = com.nextgenapp.opensocial.Activity.MediaItem.Type;
		public static const Field:Class = com.nextgenapp.opensocial.Activity.MediaItem.Field;
		
		public function MediaItem(opt_params:Array) {
			super(opt_params);
		}
	}
}