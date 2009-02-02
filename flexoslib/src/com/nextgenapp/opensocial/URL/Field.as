package com.nextgenapp.opensocial.URL
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
		 * The address the URL points to, specified as a string.  
		 */		
		public static const ADDRESS:String = "ADDRESS";
		/**
		 * The text of the link, specified as a string. 
		 */		
		public static const LINK_TEXT:String = "LINK_TEXT";
		/**
		 * The URL number type or label, specified as a string. Examples: work, blog feed, website, etc. 
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