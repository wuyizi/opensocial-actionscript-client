package com.nextgenapp.opensocial
{
	/**
	 * Base interface for all enum objects. This class allows containers to use constants for fields that are usually have a common set of values. 
	 * @author Aaron Tong, sol wu
	 * 
	 */	
	public class Enum
	{
		public static const Drinker:Class =  com.nextgenapp.opensocial.Enum.Drinker;
		public static const Gender:Class =  com.nextgenapp.opensocial.Enum.Gender;
		public static const Smoker:Class =  com.nextgenapp.opensocial.Enum.Smoker;
		
		/**
		 * The enum's key. This should be one of the defined enums below. 
		 */		
		private var _key:String;
		/**
		 * The enum's value. 
		 */		
		private var _displayValue:String;
		
		/**
		 * Enum Constructor. 
		 * @param key The enum's key. This should be one of the defined enums below.
		 * @param displayValue 
		 * 
		 */		
		public function Enum(key:String, displayValue:String)
		{
			_key = key;
			_displayValue = displayValue;
		}
		
		/**
		 * The value of this enum. This will be a user displayable string. If the container supports localization, the string will be localized. 
		 * @return The enum's value.
		 * 
		 */		
		public function getDisplayValue():String {
			return _displayValue;
		}
		
		/**
		 *  Use this for logic within your gadget. If they key is null then the value does not fit in the defined enums.
		 * @return The enum's key. This should be one of the defined enums below. 
		 * 
		 */		
		public function getKey():String {
			return _key;
		}

	}
}