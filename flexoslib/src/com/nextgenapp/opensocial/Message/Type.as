package com.nextgenapp.opensocial.Message
{
	/**
	 * The types of messages that can be sent. 
	 * @author Joseph Estrada
	 * 
	 */	
	public class Type
	{
		/**
		 * An email. 
		 */		
		public static const EMAIL:String = "EMAIL";
		/**
		 * A short private message. 
		 */		
		public static const NOTIFICATION:String = "NOTIFICATION";
		/**
		 * A message to a specific user that can be seen only by that user. 
		 */		
		public static const PRIVATE_MESSAGE:String = "PRIVATE_MESSAGE";
		/**
		 * A message to a specific user that can be seen by more than that user.
		 */
		public static const PUBLIC_MESSAGE:String = "PUBLIC_MESSAGE";
	}
}