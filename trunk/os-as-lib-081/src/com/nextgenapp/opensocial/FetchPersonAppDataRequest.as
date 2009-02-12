package com.nextgenapp.opensocial
{
	public class FetchPersonAppDataRequest extends Request
	{
		public var keys:Array = [];
		
		public function FetchPersonAppDataRequest(idSpec:IdSpec, keys:Array, optParam:Object)
		{
			super(Request.PERSON_APP_DATA_REQUEST, oParam, "", id_spec);
			this.keys = keys;
		}
		
	}
}