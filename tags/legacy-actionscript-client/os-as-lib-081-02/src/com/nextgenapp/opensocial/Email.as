package com.nextgenapp.opensocial
{
	import com.nextgenapp.opensocial.email.Field;
	
	/**
	 * Base interface for all email objects. 
	 * @author Aaron Tong
	 * 
	 */	
	public class Email extends OSResource
	{
		
		public static var Field:Class = com.nextgenapp.opensocial.email.Field;
		
		/**
		 * Email constructor.
		 * @param optFields
		 */
		public function Email(optFields:Object=null)
		{
			super(optFields);
		}
		
		public override function setField(key:String, value:*):void {
			//Do nothing since this method is not in the 0.7 spec for this class.
		}		
	}
}