package com.nextgenapp.opensocial
{
	import com.nextgenapp.opensocial.address.Field;
	
	/**
	 * Base interface for all address objects.
	 *  
	 * @author aaron tong & sol wu
	 * 
	 */	
	public class Address extends OSResource
	{
		public static var Field:Class = com.nextgenapp.opensocial.address.Field;
		
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