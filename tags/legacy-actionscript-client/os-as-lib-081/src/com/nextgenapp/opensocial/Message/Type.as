package com.nextgenapp.opensocial.Message
{
	/**
	 * The types of messages that can be sent. 
	 * @author aaron tong & sol wu
	 * 
	 */	
	public class Type
	{
		/**
		 * An email. 
		 */		
		public static const EMAIL:String = "email";
		/**
		 * A short private message. 
		 */		
		public static const NOTIFICATION:String = "notification";
		/**
		 * A message to a specific user that can be seen only by that user. 
		 */		
		public static const PRIVATE_MESSAGE:String = "privateMessage";
		/**
		 * A message to a specific user that can be seen by more than that user.
		 */
		public static const PUBLIC_MESSAGE:String = "publicMessage";
	}
}