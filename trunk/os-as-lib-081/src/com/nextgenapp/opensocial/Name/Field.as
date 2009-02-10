package com.nextgenapp.opensocial.Name
{
	import com.nextgenapp.opensocial.AField;

	public class Field extends AField
	{
		/**
		 * The additional name. 
		 */		
		public static const ADDITIONAL_NAME:String = "additionalName";
		/**
		 * The family name. 
		 */		
		public static const FAMILY_NAME:String = "familyName";
		/**
		 * The given name. 
		 */		
		public static const GIVEN_NAME:String = "givenName";
		/**
		 * The honorific prefix. 
		 */		
		public static const HONORIFIC_PREFIX:String = "honorificPrefix";
		/**
		 * The honorific suffix. 
		 */		
		public static const HONORIFIC_SUFFIX:String = "honorificSuffix";
		/**
		 * The unstructured name. 
		 */		
		public static const UNSTRUCTURED:String = "unstructured";
		
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