package com.nextgenapp.opensocial.Organization
{
	import com.nextgenapp.opensocial.AField;
	/**
	 *  All of the fields that a organization has. These are the supported keys for the Organization.getField() method.
	 * @author Joseph Estrada
	 * 
	 */	
	public class Field extends AField
	{
		/**
		 * The address of the organization, specified as an opensocial.Address. 
		 */		
		public static const ADDRESS:String = "ADDRESS";
		/**
		 * A description or notes about the person's work in the organization, specified as a string. 
		 */		
		public static const DESCRIPTION:String = "DESCRIPTION";
		/**
		 * The date the person stopped at the organization, specified as a Date. 
		 */		
		public static const END_DATE:String = "END_DATE";
		/**
		 * The field the organization is in, specified as a string. 
		 */		
		public static const FIELD:String = "FIELD";
		
		public static const NAME:String = "NAME";
		/**
		 * The salary the person receieves from the organization, specified as a string.  
		 */		
		public static const SALARY:String = "SALARY";
		/**
		 * The date the person started at the organization, specified as a Date. 
		 */		
		public static const START_DATE:String = "START_DATE";
		/**
		 * The subfield the Organization is in, specified as a string. 
		 */		
		public static const SUB_FIELD:String = "SUB_FIELD";
		/**
		 * The title or role the person has in the organization, specified as a string. 
		 */		
		public static const TITLE:String = "TITLE";
		/**
		 * A webpage related to the organization, specified as a string. 
		 */		
		public static const WEBPAGE:String = "WEBPAGE";

		/**
		 * Returns collection of organization fields. 
		 * @return Map of organization fields.
		 * 
		 */		
		public static function asMap():Object {
			return AField._asMap(Field);
		}

	}
}