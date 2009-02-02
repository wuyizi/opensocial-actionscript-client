package com.nextgenapp.opensocial
{
	/**
	 * Base interface for all body type objects. 
	 * @author Joseph Estrada
	 * 
	 */	
	public class BodyType extends OSResource
	{
		public static const Field:Class = com.nextgenapp.opensocial.BodyType.Field;
		
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