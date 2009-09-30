/**
 * Field - Opensocial person field
 * 
 * @author Aaron Tong
 */
package com.nextgenapp.opensocial.Person
{
	import com.nextgenapp.opensocial.AField;
		
	public class Field extends AField 
	{
		/**
		 * A general statement about the person, specified as a String. 
		 */		
		public static const ABOUT_ME:String = "ABOUT_ME";
		/**
		 * Person's favorite activities, specified as an Array of Strings. 
		 */		
		public static const ACTIVITIES:String = "ACTIVITIES";
		/**
		 * Addresses associated with the person, specified as an Array of Addresses. 
		 */		
		public static const ADDRESSES:String = "ADDRESSES";
		/**
		 * Person's age, specified as a number. Not supported by all containers.  
		 */		
		public static const AGE:String = "AGE";
		/**
		 * Person's body characteristics, specified as an opensocial.BodyType. 
		 */
		public static const BODY_TYPE:String = "BODY_TYPE";
		/**
		 * Person's favorite books, specified as an Array of Strings. 
		 */		
		public static const BOOKS:String = "BOOKS";
		/**
		 * Person's favorite cars, specified as an Array of Strings. 
		 */		
		public static const CARS:String = "CARS";
		/**
		 * Description of the person's children, specified as a String. 
		 */		
		public static const CHILDREN:String = "CHILDREN";
		/**
		 * Person's current location, specified as an Address. 
		 */		
		public static const CURRENT_LOCATION:String = "CURRENT_LOCATION";
		/**
		 * Person's date of birth, specified as a Date object. 
		 */		
		public static const DATE_OF_BIRTH:String = "DATE_OF_BIRTH";
		/**
		 * Person's drinking status, specified as an opensocial.Enum with the enum's key referencing opensocial.Enum.Drinker. 
		 */		
		public static const DRINKER:String = "DRINKER";
		/**
		 *  Emails associated with the person, specified as an Array of Emails. 
		 */		
		public static const EMAILS:String = "EMAILS";
		/**
		 * Person's ethnicity, specified as a String. 
		 */		
		public static const ETHNICITY:String = "ETHNICITY";
		/**
		 * Person's thoughts on fashion, specified as a String. 
		 */		
		public static const FASHION:String = "FASHION";
		/**
		 * Person's favorite food, specified as an Array of Strings. 
		 */		
		public static const FOOD:String = "FOOD";
		/**
		 * Person's gender, specified as a string. Not supported by all containers. 
		 */		
		public static const GENDER:String = "GENDER";
		/**
		 * Describes when the person is happiest, specified as a String. 
		 */		
		public static const HAPPIEST_WHEN:String = "HAPPIEST_WHEN";
		/**
		 * Describes when the person is happiest, specified as a string.
		 */
		public static const HAS_APP:String = "HAS_APP";
		/**
		 * Person's favorite heroes, specified as an Array of Strings. 
		 */		
		public static const HEROES:String = "HEROES";
		/**
		 * Person's thoughts on humor, specified as a String. 
		 */		
		public static const HUMOR:String = "HUMOR";
		/**
		 * A string ID that can be permanently associated with this person.
		 */
		public static const ID:String = "ID";
		/**
		 * Person's interests, hobbies or passions, specified as an Array of Strings. 
		 */		
		public static const INTERESTS:String = "INTERESTS";
		/**
		 * Person's favorite jobs, or job interests and skills, specified as a String. 
		 */		
		public static const JOB_INTERESTS:String = "JOB_INTERESTS";
		/**
		 *  Jobs the person has held, specified as an Array of Organizations.
		 */		
		public static const JOBS:String = "JOBS";
		/**
		 * List of the languages that the person speaks as ISO 639-1 codes, specified as an Array of Strings. 
		 */		
		public static const LANGUAGES_SPOKEN:String = "LANGUAGES_SPOKEN";
		/**
		 * Description of the person's living arrangement, specified as a String. 
		 */		
		public static const LIVING_ARRANGEMENT:String = "LIVING_ARRANGEMENT";
		/**
		 * Person's statement about who or what they are looking for, or what they are interested in meeting people for. 
		 */		
		public static const LOOKING_FOR:String = "LOOKING_FOR";
		/**
		 * Person's favorite movies, specified as an Array of Strings.  
		 */		
		public static const MOVIES:String = "MOVIES";
		/**
		 * Person's favorite music, specified as an Array of Strings. 
		 */		
		public static const MUSIC:String = "MUSIC";
		/**
		 * A string containing the person's name. 
		 */		
		public static const NAME:String = "NAME";
		/**
		 * Person's current network status. 
		 */
		public static const NETWORK_PRESENCE:String = "NETWORK_PRESENCE";
		/**
		 * A String representing the person's nickname. 
		 */		
		public static const NICKNAME:String = "NICKNAME";
		/**
		 * Description of the person's pets, specified as a String. 
		 */		
		public static const PETS:String = "PETS";
		/**
		 * Phone numbers associated with the person, specified as an Array of Phones. 
		 */		
		public static const PHONE_NUMBERS:String = "PHONE_NUMBERS";
		/**
		 * Person's political views, specified as a String. 
		 */		
		public static const POLITICAL_VIEWS:String = "POLITICAL_VIEWS";
		/**
		 * Person's profile song, specified as an opensocial.Url. 
		 */		
		public static const PROFILE_SONG:String = "PROFILE_SONG";
		/**
		 * Person's profile URL, specified as a string. 
		 */				
		public static const PROFILE_URL:String = "PROFILE_URL";
		/**
		 * Person's profile video, specified as an opensocial.Url. 
		 */		
		public static const PROFILE_VIDEO:String = "PROFILE_VIDEO";
		/**
		 * Person's favorite quotes, specified as an Array of Strings. 
		 */		
		public static const QUOTES:String = "QUOTES";
		/**
		 * Person's relationship status, specified as a String. 
		 */		
		public static const RELATIONSHIP_STATUS:String = "RELATIONSHIP_STATUS";
		/**
		 * Person's relgion or religious views, specified as a String. 
		 */		
		public static const RELIGION:String = "RELIGION";
		/**
		 * Person's comments about romance, specified as a String. 
		 */		
		public static const ROMANCE:String = "ROMANCE";
		/**
		 * What the person is scared of, specified as a String. 
		 */		
		public static const SCARED_OF:String = "SCARED_OF";
		/**
		 * Schools the person has attended, specified as an Array of Organizations. 
		 */		
		public static const SCHOOLS:String = "SCHOOLS";
		/**
		 * Person's sexual orientation, specified as a String. 
		 */		
		public static const SEXUAL_ORIENTATION:String = "SEXUAL_ORIENTATION";
		/**
		 * Person's smoking status, specified as an opensocial.Enum with the enum's key referencing opensocial.Enum.Smoker. 
		 */		
		public static const SMOKER:String = "SMOKER";
		/**
		 * Person's favorite sports, specified as an Array of Strings. 
		 */		
		public static const SPORTS:String = "SPORTS";
		/**
		 * Person's status, headline or shoutout, specified as a String. 
		 */		
		public static const STATUS:String = "STATUS";
		/**
		 * Arbitrary tags about the person, specified as an Array of Strings. 
		 */		
		public static const TAGS:String = "TAGS";
		/**
		 * Person's photo thumbnail URL, specified as a string. 
		 */		
		public static const THUMBNAIL_URL:String = "THUMBNAIL_URL";
		/**
		 * Person's time zone, specified as the difference in minutes between Greenwich Mean Time (GMT) and the user's local time. 
		 */		
		public static const TIME_ZONE:String = "TIME_ZONE";
		/**
		 *  Person's turn offs, specified as an Array of Strings.
		 */		
		public static const TURN_OFFS:String = "TURN_OFFS";
		/**
		 * Person's turn ons, specified as an Array of Strings. 
		 */		
		public static const TURN_ONS:String = "TURN_ONS";
		/**
		 * Person's favorite TV shows, specified as an Array of Strings. 
		 */		
		public static const TV_SHOWS:String = "TV_SHOWS";
		/**
		 * URLs related to the person, their webpages, or feeds. 
		 */		
		public static const URLS:String = "URLS";
		
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