package com.nextgenapp.opensocial.url
{
	import com.nextgenapp.opensocial.AField;
	
	/**
	 * fields in Url
	 * http://wiki.opensocial.org/index.php?title=Opensocial.Url_(v0.8)
	 * 
	 * @author sol wu & aaron tong
	 */
	public class Field extends AField
	{
		/** The address the URL points to, specified as a string. */
		public static const ADDRESS:String = "ADDRESS";
		/** The text of the link, specified as a string. */
		public static const LINK_TEXT:String = "LINK_TEXT";
		/** The URL number type or label, specified as a string. */
		public static const TYPE:String = "TYPE";
		
		/**
		 * a hashmap of all url fields
		 * @return Map of url fields.
		 */
		public static function asMap():Object {
			return AField._asMap(Field);
		}
	}
}