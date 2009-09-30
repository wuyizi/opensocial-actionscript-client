package com.nextgenapp.opensocial.Message
{
	import com.nextgenapp.opensocial.AField;

	/**
	 * All of the fields that messages can have. 
	 * @author Joseph Estrada
	 * 
	 */
	public class Field extends AField
	{
		/**
		 * The main text of the message. 
		 */		
		public static const BODY:String = "BODY";
		/**
		 * The main text of the message as a message template. 
		 */
		public static const BODY_ID:String = "BODY_ID";
		/**
		 * The title of the message. 
		 */		
		public static const TITLE:String = "TITLE";
		/**
		 * The title of the message as a message template. Specifies the message ID to use in the gadget xml. 
		 */
		public static const TITLE_ID:String = "TITLE_ID";
		/**
		 * The title of the message, specified as an opensocial.Message.Type. 
		 */		
		public static const TYPE:String = "TYPE";

		/**
		 * Returns collection of fields. 
		 * @return Map of person fields.
		 * 
		 */		
		public static function asMap():Object {
			return AField._asMap(Field);
		}

	}
}