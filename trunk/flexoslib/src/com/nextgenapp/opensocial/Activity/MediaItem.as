/**
 * Copyright 2008 Fox Interative Media.
 * 
 * Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except 
 * in compliance with the License. You may obtain a copy of the License at 
 * http://www.apache.org/licenses/LICENSE-2.0 Unless required by applicable law or agreed to in 
 * writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT 
 * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific 
 * language governing permissions and limitations under the License.
 */
package opensocial.Activity {
	import opensocial.Activity.MediaItem.*;
	import opensocial.OSResource;
	/**
	 * A media item associated with an activity. Represents images, movies, and audio. Create a MediaItem object using the opensocial.newActivityMediaItem() method. 
	 * @author Joseph Estrada
	 * 
	 */	
	public class MediaItem extends OSResource {
		public static const Type:Class = opensocial.Activity.MediaItem.Type;
		public static const Field:Class = opensocial.Activity.MediaItem.Field;
		
		public function MediaItem(opt_params:Array) {
			super(opt_params);
		}
	}
}