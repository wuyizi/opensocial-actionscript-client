package com.nextgenapp.opensocial
{
	/**
	 * Base interface for all URL objects.
	 * @author Joseph Estrada
	 * 
	 */	
	public class URL extends OSResource
	{
		public static const Field:Class = com.nextgenapp.opensocial.URL.Field;
		
		/**
		 * URL constructor. 
		 * @param optFields
		 * 
		 */		
		public function URL(optFields:Object=null)
		{
			super(optFields);
		}
		
		/**
		 * Overrides OSResource.setField function to forbid setting fields for this object. 
		 * @param key
		 * @param value
		 * 
		 */				
		public override function setField(key:String, value:*):void {
			//Do nothing since this method is not in the 0.7 spec for this class.
		}
	}
}