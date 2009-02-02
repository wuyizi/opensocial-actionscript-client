package com.nextgenapp.opensocial
{
	import com.nextgenapp.opensocial.Phone.Field;
	
	/**
	 * Base interface for all phone objects. 
	 * @author Joseph Estrada
	 * 
	 */	
	public class Phone extends OSResource
	{
		public static const Field:Class = com.nextgenapp.opensocial.Phone.Field;
		/**
		 * Phone Constructor 
		 * @param optFields
		 * 
		 */		
		public function Phone(optFields:Object=null)
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