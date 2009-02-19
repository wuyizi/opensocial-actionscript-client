package com.nextgenapp.opensocial.name
{
	import com.nextgenapp.opensocial.AField;

	public class Field extends AField
	{
		/**
		 * The additional name. 
		 */		
		public static const ADDITIONAL_NAME:String = "ADDITIONAL_NAME";
		/**
		 * The family name. 
		 */		
		public static const FAMILY_NAME:String = "FAMILY_NAME";
		/**
		 * The given name. 
		 */		
		public static const GIVEN_NAME:String = "GIVEN_NAME";
		/**
		 * The honorific prefix. 
		 */		
		public static const HONORIFIC_PREFIX:String = "HONORIFIC_PREFIX";
		/**
		 * The honorific suffix. 
		 */		
		public static const HONORIFIC_SUFFIX:String = "HONORIFIC_SUFFIX";
		/**
		 * The unstructured name. 
		 */		
		public static const UNSTRUCTURED:String = "UNSTRUCTURED";
		
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