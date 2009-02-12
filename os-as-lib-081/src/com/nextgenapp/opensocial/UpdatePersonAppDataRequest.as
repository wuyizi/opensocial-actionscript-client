package com.nextgenapp.opensocial
{
	public class UpdatePersonAppDataRequest extends Request
	{
		public var key:String = "";
		public var value:String = "";
		
		public function UpdatePersonAppDataRequest(id:String, key:String, value:String)
		{
			super(Request.UPDATE_PERSON_APP_DATA_REQUEST);
			this.key = key;
			this.value = value;
		}
		
	}
}