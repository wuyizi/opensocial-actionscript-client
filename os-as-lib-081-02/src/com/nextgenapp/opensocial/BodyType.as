package com.nextgenapp.opensocial
{
	import com.nextgenapp.opensocial.bodyType.Field;
	
	/**
	 * Base interface for all body type objects. 
	 * @author Aaron Tong
	 * 
	 */	
	public class BodyType extends OSResource
	{
		public static var Field:Class = com.nextgenapp.opensocial.bodyType.Field;
		
		/**
		 * BodyType constructor.
		 * @param optFields
		 * 
		 */		
		public function BodyType(optFields:Object=null)
		{
			super(optFields);
		}
		
		public override function setField(key:String, value:*):void {
			//Do nothing since this method is not in the 0.7 spec for this class.
		}
	}
}