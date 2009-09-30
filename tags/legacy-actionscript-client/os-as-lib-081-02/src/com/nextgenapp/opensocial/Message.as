package com.nextgenapp.opensocial
{
	import com.nextgenapp.opensocial.message.Field;
	
	/**
	 * http://wiki.opensocial.org/index.php?title=Opensocial.Message_(v0.8)
	 *  
	 * @author aaron tong & sol wu
	 * 
	 */	
	public class Message extends OSResource
	{
		public static var Field:Class = com.nextgenapp.opensocial.message.Field;
		public static var Type:Class = com.nextgenapp.opensocial.message.Type;
		
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