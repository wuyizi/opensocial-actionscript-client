package com.nextgenapp.opensocial
{
	import flash.utils.describeType;
	
	/**
	 * Abstract class that provides a helper method for a resource field set (ex. opensocial.Person.Field).  
	 * @author Joseph Estrada
	 * 
	 */	
	public class AField
	{
		/**
		 *  Iterates through the constants of a resource field set (ex. opensocial.Person.Field) and returns a map using the value for each constants as the key and value for an entry.
		 * @param cls
		 * @return 
		 * 
		 */		
		public static function _asMap(cls:Class):Object {
			var xmlRep:XML = describeType(cls);
			var constants:XMLList = xmlRep.constant;
			var fields:Object = {};
			for(var i:int = 0; i < constants.length(); i++) {
				var field:String = constants[i].@name.toString();
				fields[field] = field;
			}
			return fields;
		}
	}
}