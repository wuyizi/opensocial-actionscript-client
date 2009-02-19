/**
 * Field - MySpace Person Fields
 * 
 * @author Aaron Tong
 */
package com.nextgenapp.opensocial.myspace.person
{
	import com.nextgenapp.opensocial.AField;
	
	/**
	 * All of the fields that a MyOpenSpace.Person has. 
	 * @author aaron tong
	 * 
	 */	
	public class Field extends AField
	{				
		// opensocial.Person fields.
		
		/**
		 * Person's age, specified as a number. Not supported by all containers.  
		 */		
		public static const AGE:String = "AGE";
		/**
		 * Person's gender, specified as a string. Not supported by all containers. 
		 */		
		public static const GENDER:String = "GENDER";
		/**
		 * A string ID that can be permanently associated with this person.
		 */
		//public static const ID:String = "ID";
		/**
		 * A string containing the person's name. 
		 */		
		//public static const NAME:String = "NAME";
		/**
		 * Person's profile URL, specified as a string. 
		 */				
		//public static const PROFILE_URL:String = "PROFILE_URL";
		/**
		 * Person's photo thumbnail URL, specified as a string. 
		 */		
		//public static const THUMBNAIL_URL:String = "THUMBNAIL_URL";
		
		/**
		 * Image URI for a person's large image. 
		 */				
		public static const LARGE_IMAGE_URI:String = "LARGE_IMAGE_URI";
		
		/**
		 * Last date person's profile was updated. 
		 */		
		public static const LAST_UPDATED_DATE:String = "LAST_UPDATED_DATE";
		
		/**
		 * A string representing a Person's city of residence. 
		 */		
		public static const CITY:String = "CITY";
		/**
		 * A string representing a Person's state/province/region of residence.
		 */
		public static const REGION:String = "REGION";
		/**
		 * A string representing a Person's zip/postal code. 
		 */		
		public static const POSTALCODE:String = "POSTALCODE";
		/**
		 * A string representing a Person's country of residence. 
		 */		
		public static const COUNTRY:String = "COUNTRY";
		/**
		 * A string representing a Person's city of birth. 
		 */		
		public static const HOMETOWN:String = "HOMETOWN";
		/**
		 * A string representing non-specific details about a Person.
		 */		
		public static const ABOUT:String = "ABOUT";
		/**
		 * A string representing non-specific details about a Person. 
		 */		
		public static const CULTURE:String = "CULTURE";
		/**
		 * A string representing a Person's marital status. 
		 */		
		public static const MARITAL_STATUS:String = "MARITAL_STATUS";
		/**
		 * A string representing a Person's non-specific interests. 
		 */		
		public static const INTERESTS:String = "INTERESTS";
		/**
		 * A string representing a Person's interests in music. 
		 */		
		public static const MUSIC:String = "MUSIC";
		/**
		 * A string representing a Person's interests in movies. 
		 */				 
		public static const MOVIES:String = "MOVIES";
		/**
		 * A string representing a Person's interests in television. 
		 */		
		public static const TELEVISION:String = "TELEVISION";
		/**
		 * A string representing a Person's interests in books. 
		 */		
		public static const BOOKS:String = "BOOKS";
		/**
		 * A string representing a Person's heroes. 
		 */		
		//public static const HEROES:String = "HEROES";
		/**
		 * A string representing a Person's headline or shoutout. 
		 */		
		public static const HEADLINE:String = "HEADLINE";
		/**
		 * A string representing a Person's current job and job history. 
		 */		
		public static const OCCUPATION:String = "OCCUPATION";
		/**
		 * A string representing a Person's zodiac sign. 
		 */		
		public static const ZODIAC_SIGN:String = "ZODIAC_SIGN";
		/**
		 * A string representing a Person's current mood. 
		 */		
		public static const MOOD:String = "MOOD";
		
		/**
		 * A string representing a the last time a Person's mood was updated.
		 */
		 public static const MOOD_LAST_UPDATED:String = "MOOD_LAST_UPDATED";
		 
		/**
		 * A string representing a Person's status. 
		 */		
		//public static const STATUS:String = "STATUS";
		/**
		 * A string representing a list of people the Person would like to meet. 
		 */		
		public static const DESIRE_TO_MEET:String = "DESIRE_TO_MEET";
		
		/**
		 * A string representing whether a person is currently online. 
		 */		
		public static const ONLINE_NOW:String = "ONLINE_NOW";
		
		/**
		 * Returns collection of person fields. 
		 * @return Map of person fields.
		 * 
		 */		
		public static function asMap():Object {
			return AField._asMap(Field);
		}
	}
}