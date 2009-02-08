package com.nextgenapp.opensocial
{
	/**
	 * Base interface for all email objects. 
	 * @author Joseph Estrada
	 * 
	 */	
	public class Email extends OSResource
	{
		
		public static const Field:Class = com.nextgenapp.opensocial.Email.Field;
		
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