package com.nextgenapp.opensocial.bodyType
{
	import com.nextgenapp.opensocial.AField;
	
	/**
	 * All of the fields that a body type has. These are the supported keys for the BodyType.getField() method. 
	 * @author aaron tong & sol wu
	 * 
	 */	
	public class Field extends AField
	{
		/**
		 * The build of the person's body, specified as a string. 
		 */		
		public static const BUILD:String = "BUILD";
		/**
		 * The eye color of the person, specified as a string.
		 */
		public static const EYE_COLOR:String = "EYE_COLOR";
		/**
		 * The hair color of the person, specified as a string. 
		 */		
		public static const HAIR_COLOR:String = "HAIR_COLOR";
		/**
		 * The height of the person in meters, specified as a number. 
		 */		
		public static const HEIGHT:String = "HEIGHT";
		/**
		 * The weight of the person in kilograms, specified as a number.
		 */
		public static const WEIGHT:String = "WEIGHT";
		
		/**
		 * Returns collection of body type fields. 
		 * @return Map of person fields.
		 * 
		 */		
		public static function asMap():Object {
			return AField._asMap(Field);
		}

	}
}