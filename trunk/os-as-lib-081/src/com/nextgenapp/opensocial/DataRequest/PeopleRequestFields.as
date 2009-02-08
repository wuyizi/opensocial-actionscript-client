/**
 * PeopleRequestFields - Opensocial PeopleRequestFields
 * 
 * @author Aaron Tong
 */
package com.nextgenapp.opensocial.DataRequest
{
	/**
	 * Optional request fields for people/person requests. 
	 * @author Joseph Estrada
	 * 
	 */	
	public class PeopleRequestFields
	{
		/**
		 * How to filter the people objects; defaults to ALL. Possible values are defined by FilterType. 
		 */		
		public static const FILTER:String = "FILTER";
		/**
		 * Additional options to be passed into the filter, specified as a Map<String, Object>.
		 */
		public static const FILTER_OPTIONS:String = "FILTER_OPTIONS";
		/**
		 * When paginating, the index of the first item to fetch. Specified as a Number. 
		 */		
		public static const FIRST:String = "FIRST";
		/**
		 * The maximum number of items to fetch; defaults to 20. If set to a larger number, a container may honor the request, or may limit the number to a container-specified limit of at least 20. Specified as a Number. 
		 */		
		public static const MAX:String = "MAX";
		/**
		 * An Array specifying what profile data to fetch for each of the person objects. The server will always include opensocial.Person.Field.ID, opensocial.Person.Field.NAME, and opensocial.Person.Field.THUMBNAIL_URL. 
		 */		
		public static const PROFILE_DETAILS:String = "PROFILE_DETAILS";
		/**
		 * A sort order for the people objects; defaults to TOP_FRIENDS. Possible values are defined by SortOrder.
		 */
		public static const SORT_ORDER:String = "SORT_ORDER";
	}
}