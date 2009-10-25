/**
 * ResponseItem - opensocial DataResponse ResponseItem
 * 
 * @author Aaron Tong
 */
package com.nextgenapp.opensocial
{
	public class ResponseItem
	{
		private var _originalDataRequest:DataRequest;
		private var _data:*;
		private var _optErrorCode:String;
		private var _optErrorMessage:String
		
		/**
		 * ResponseItem constructor. 
		 * @param originalDataRequest Original data request.
		 * @param data Response data sent by server.
		 * @param opt_errorCode Error code if request had an error.
		 * @param opt_errorMessage Error message if request had an error.
		 * 
		 */		
		public function ResponseItem(originalDataRequest:DataRequest, data:*, opt_errorCode:String=null, opt_errorMessage:String=null)
		{
			super();
			this._originalDataRequest = originalDataRequest;
			this._data = data;
			this._optErrorCode = opt_errorCode;
			this._optErrorMessage = opt_errorMessage;
		}
		
		/**
		 * Gets the response data. 
		 * @return The requested value calculated by the server; the type of this value is defined by the type of request that was made.
		 * 
		 */		
		public function getData():* {
			return _data;
		}
		
		/**
		 * If the request had an error, returns the error code. The error code can be container-specific or one of the values defined by Error. 
		 * @return The error code, or null if no error occurred.
		 * 
		 */		
		public function getErrorCode():String {
			return _optErrorCode;
		}
		
		/**
		 * If the request had an error, returns the error message. 
		 * @return A human-readable description of the error that occurred; can be null, even if an error occurred.
		 * 
		 */		
		public function	getErrorMessage():String {		
			return _optErrorMessage;
		}
		
		/**
		 * Returns the original data request. 
		 * @return The data request used to fetch this data response.
		 * 
		 */		
		public function getOriginalDataRequest():DataRequest {
			return _originalDataRequest;
		}
		
		/**
		 * Returns true if there was an error in fetching this data from the server.  
		 * @return True if there was an error; otherwise, false.
		 * 
		 */		
		public function hadError():Boolean {
			return !!_optErrorCode;
		}
	}
}