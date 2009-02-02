package com.nextgenapp.opensocial
{
	/**
	 * Base interface for all message objects. 
	 * @author Joseph Estrada
	 * 
	 */	
	public class Message extends OSResource
	{
		public static const Field:Class = com.nextgenapp.opensocial.Message.Field;
		public static const Type:Class = com.nextgenapp.opensocial.Message.Type;
		
		/**
		 * Message constructor. 
		 * @param optFields
		 * 
		 */		
		public function Message(optFields:Object=null)
		{
			super(optFields);
		}
		
	}
}