package com.nextgenapp.opensocial
{
	import com.nextgenapp.opensocial.organization.Field;
	
	/**
	 * Base interface for all organization objects. 
	 * @author Aaron Tong
	 * 
	 */	
	public class Organization extends OSResource
	{
		public static var Field:Class = com.nextgenapp.opensocial.organization.Field;
		
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