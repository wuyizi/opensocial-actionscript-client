package com.nextgenapp.opensocial
{
	import com.nextgenapp.opensocial.url.Field;
	
	/**
	 * Base interface for all URL objects
	 * http://wiki.opensocial.org/index.php?title=Opensocial.Url_(v0.8)
	 * 
	 * @author sol wu & aaron tong
	 */
	public class Url extends OSResource
	{
		public static var Field:Class = com.nextgenapp.opensocial.url.Field;
		
		public function Url(optFields:Object=null)
		{
			super(optFields);
		}
		
		/**
		 * Overrides OSResource.setField function to forbid setting fields for this object. 
		 */
		public override function setField(key:String, value:*):void {
			// //Do nothing since this method is not in the 0.8 spec for this class.
		}
	}
}