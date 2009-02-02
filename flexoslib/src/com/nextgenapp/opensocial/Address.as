package com.nextgenapp.opensocial
{
	/**
	 * Base interface for all address objects.
	 *  
	 * @author Joseph Estrada
	 * 
	 */	
	public class Address extends OSResource
	{
		public static const Field:Class = com.nextgenapp.opensocial.Address.Field;
		
		/**
		 * Address constructor. 
		 * @param optFields
		 * 
		 */		
		public function Address(optFields:Object=null)
		{
			super(optFields);
		}
		
		public override function setField(key:String, value:*):void {
			//Do nothing since this method is not in the 0.7 spec for this class.
		}
	}
}