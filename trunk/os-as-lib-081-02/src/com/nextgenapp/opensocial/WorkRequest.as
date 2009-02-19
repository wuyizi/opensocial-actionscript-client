/**
 * WorkRequest - Work requests for the DataRequest object
 * 
 * @author Aaron Tong
 */
package com.nextgenapp.opensocial
{
	public class WorkRequest
	{
		private var _request:Request = null;
		
		private var _optField:String = null;
		
		public function WorkRequest(r:Request, opt:String=null)
		{
			_request = r;
			_optField = opt;
		}
		
		public function get opt_key():String {
			return _optField;
		}
		
		public function set opt_key(k:String):void {
			_optField = k;
		}
		
		public function get request():Request {
			return _request;
		}
		
		public function set request(r:Request):void {
			_request = r;
		}

	}
}