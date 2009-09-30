package com.nextgenapp.opensocial.escapeType
{
	import com.nextgenapp.opensocial.AField;

	/**
	 * All of the fields for escape type 
	 * http://wiki.opensocial.org/index.php?title=Opensocial.EscapeType_(v0.8)
	 * @author sol wu & aaron tong
	 * 
	 */
	public class Field extends AField
	{
		/**
		 * When used will HTML-escape the data. This field may be used interchangeably with the string 'htmlEscape'.
		 */		
		public static const HTML_ESCAPE:String = "htmlEscape";
		/**
		 * When used will not escape the data. This field may be used interchangeably with the string 'none'.
		 */
		public static const NONE:String = "none";

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