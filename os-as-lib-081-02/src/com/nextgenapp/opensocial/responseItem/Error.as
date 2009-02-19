/**
 * ResponseItem - Opensocial Response Item
 * 
 * @author Aaron Tong
 */
package com.nextgenapp.opensocial.responseItem {
	
	public class Error {
		/**
		 * The request was invalid. Example: 'max' was -1. 
		 */		
		public static const BAD_REQUEST:String = "BAD_REQUEST";
		/**
		 * The gadget can never have access to the requested data. 
		 */		
		public static const FORBIDDEN:String = "FORBIDDEN";
		/**
		 * The request encountered an unexpected condition that prevented it from fulfilling the request. 
		 */				
		public static const INTERNAL_ERROR:String = "INTERNAL_ERROR";
		/**
		 * This container does not support the request that was made.
		 */
  		public static const NOT_IMPLEMENTED:String = "NOT_IMPLEMENTED";
		/**
		 * The gadget does not have access to the requested data. To get access, use opensocial.requestPermission(). 
		 */  		
		public static const UNAUTHORIZED:String = "UNAUTHORIZED";
	}
}