package com.nextgenapp.opensocial.message
{
	import com.nextgenapp.opensocial.AField;

	/**
	 * All of the fields that messages can have. 
	 * @author aaron tong & sol wu
	 * 
	 */
	public class Field extends AField
	{
		/**
		 * The main text of the message. 
		 */		
		public static const BODY:String = "body";
		/**
		 * The main text of the message as a message template. 
		 */
		public static const BODY_ID:String = "bodyId";
		/**
		 * The title of the message. 
		 */		
		public static const TITLE:String = "title";
		/**
		 * The title of the message as a message template. Specifies the message ID to use in the gadget xml. 
		 */
		public static const TITLE_ID:String = "titleId";
		/**
		 * The title of the message, specified as an opensocial.Message.Type. 
		 */		
		public static const TYPE:String = "type";

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