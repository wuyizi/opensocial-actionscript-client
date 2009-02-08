package com.nextgenapp.opensocial
{
	/**
	 * Base interface for all organization objects. 
	 * @author Joseph Estrada
	 * 
	 */	
	public class Organization extends OSResource
	{
		public static const Field:Class = com.nextgenapp.opensocial.Organization.Field;
		
		/**
		 * Organization constructor.
		 * @optFields
		 */
		public function Organization(optFields:Object=null)
		{
			super(optFields);
		}
		
		public override function setField(key:String, value:*):void {
			//Do nothing since this method is not in the 0.7 spec for this class.
		}		
	}
}