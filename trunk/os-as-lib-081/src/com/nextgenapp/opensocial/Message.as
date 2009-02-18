package com.nextgenapp.opensocial
{
	import com.nextgenapp.opensocial.Message.Field;
	
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
		public function Message(body:String, optFields:Object=null)
		{
			super(optFields);
			setField(com.nextgenapp.opensocial.Message.Field.BODY, body);
		}
		
	}
}