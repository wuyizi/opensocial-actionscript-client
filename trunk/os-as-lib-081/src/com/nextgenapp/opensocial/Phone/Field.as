package com.nextgenapp.opensocial.Phone
{
	import com.nextgenapp.opensocial.AField;
	/**
	 * All of the fields that a phone has. These are the supported keys for the Phone.getField() method.
	 * @author Joseph Estrada
	 * 
	 */	
	public class Field extends com.nextgenapp.opensocial.AField
	{
		/**
		 * The phone number, specified as a String. 
		 */		
		public static const NUMBER:String = "NUMBER";
		/**
		 * The phone number type or label, specified as a String. 
		 */		
		public static const TYPE:String = "TYPE";

		/**
		 * Returns collection of phone fields. 
		 * @return Map of phone fields.
		 * 
		 */
		public static function asMap():Object {
			return AField._asMap(Field);
		}

	}
}