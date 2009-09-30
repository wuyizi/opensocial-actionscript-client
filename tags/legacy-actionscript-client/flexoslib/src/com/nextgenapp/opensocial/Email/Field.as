package com.nextgenapp.opensocial.Email
{
	import com.nextgenapp.opensocial.AField;
	/**
	 * All of the fields that an email has. These are the supported keys for the Email.getField() method. 
	 * @author Joseph Estrada
	 * 
	 */	
	public class Field extends AField
	{
		/**
		 * The email address, specified as a String. 
		 */		
		public static const ADDRESS:String = "ADDRESS";
		/**
		 * The email type or label, specified as a String. 
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