package com.nextgenapp.opensocial
{
	/**
	 * Base interface for all name objects.
	 * @author Aaron Tong
	 * 
	 */	
	public class Name extends OSResource
	{
		public static const Field:Class = com.nextgenapp.opensocial.Name.Field;
		
		/**
		 * Name constructor. 
		 * @param optFields
		 * 
		 */		
		public function Name(optFields:Object=null)
		{
			super(optFields);
		}
		
		public override function setField(key:String, value:*):void {
			//Do nothing since this method is not in the 0.7 spec for this class.
		}

		
	}
}