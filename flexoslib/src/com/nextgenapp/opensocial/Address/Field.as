package com.nextgenapp.opensocial.Address
{
	import com.nextgenapp.opensocial.AField;

	public class Field extends AField
	{
		
		/**
		 * The country. 
		 */				
		public static const COUNTRY:String = "COUNTRY";
		/**
		 * The extended street address. 
		 */		
		public static const EXTENDED_ADDRESS:String = "EXTENDED_ADDRESS";
		/**
		 * The latitude. 
		 */		
		public static const LATITUDE:String = "LATITUDE";
		/**
		 * The locality. 
		 */		
		public static const LOCALITY:String = "LOCALITY";
		/**
		 * The longitude. 
		 */		
		public static const LONGITUDE:String = "LONGITUDE";
		/**
		 * The po box of the address if there is one. 
		 */		
		public static const PO_BOX:String = "PO_BOX";
		/**
		 * The post code. 
		 */		
		public static const POSTAL_CODE:String = "POSTAL_CODE";
		/**
		 * The region. 
		 */		
		public static const REGION:String = "REGION";
		/**
		 * The street address. 
		 */		
		public static const STREET_ADDRESS:String = "STREET_ADDRESS";
		/**
		 * The address type or label. 
		 */		
		public static const TYPE:String = "TYPE";
		/**
		 * If the container does not have structured addresses in its data store, this field will return the unstructured address that the user entered. 
		 */		
		public static const UNSTRUCTURED_ADDRESS:String = "UNSTRUCTURED_ADDRESS";		
		/**
		 * Returns collection of Address fields. 
		 * @return Map of person fields.
		 * 
		 */		
		public static function asMap():Object {
			return AField._asMap(Field);
		}		
	}
}