/**
 * Request - Abstract class for requests from DataRequest
 * 
 * @author Aaron Tong
 */
package com.nextgenapp.opensocial
{
	
	public class Request {
		
		/**
		 * Holds the request types
		 */
		public static const NO_REQUEST:int = -1;
		
		/**
		 * Holds the request types
		 */
		public static const PERSON_REQUEST:int = 0;
		
		/**
		 * Holds the request types
		 */
		public static const PEOPLE_REQUEST:int = 1;
		
		/**
		 * Holds the request types
		 */
		public static const ACTIVITY_REQUEST:int = 2;
		
		/**
		 * Holds the request types
		 */
		public static const PERSON_APP_DATA_REQUEST:int = 3;
		
		/**
		 * Holds the request types
		 */
		public static const REMOVE_PERSON_APP_DATA_REQUEST:int = 4;
		
		/**
		 * Holds the request types
		 */
		public static const UPDATE_PERSON_APP_DATA_REQUEST:int = 5;
		
		/**
		 * Holds the request type
		 */
		public var _type:int = NO_REQUEST;
		
		/**
		 * Holds the optional param
		 */
		private var _optParam:Object = null;
		
		/**
		 * Holds the id
		 */
		private var _id:String = "";
		
		/**
		 * Holds the idSpec
		 */
		private var _idSpec:IdSpec = null;
		
		/**
		 * Request - Constructor
		 * 
		 * @param t the type field
		 */
		public function Request(t:int, oParam:Object=null, id:String="", id_spec:IdSpec=null){
			_type = t;
			_optParam = oParam;
			_id = id;
			_idSpec = id_spec;
		}
		
		public function get type():int {
			return _type;
		}
		
		public function set type(t:int):void{
			_type = t;
		}

		public function get opt_params():Object {
			return _optParam;
		}
		
		public function set opt_params(o:Object):void {
			_optParam = o;
		}
		
		public function get id():String {
			return _id;
		}
		
		public function set id(i:String):void {
			_id = i;
		}
		
		public function get idspec():IdSpec {
			return _idSpec;
		}
		
		public function set idspec(sp:IdSpec):void {
			_idSpec = sp;
		}
	}
}