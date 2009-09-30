/**
 * FilterType - Opensocial filter type for DataRequest
 * 
 * @author Aaron Tong
 */
package com.nextgenapp.opensocial.dataRequest
{
	public class FilterType
	{		
		/**
		 * Retrieves all friends. 
		 */		
		public static const ALL:String = "ALL";
		/**
		 * Retrieves all friends with any data for this application. 
		 */		
		public static const HAS_APP:String = "HAS_APP";
		/**
		 * Retrieves only the user's top friends as defined by the container. 
		 */
		public static const TOP_FRIENDS:String = "TOP_FRIENDS";

	}
}