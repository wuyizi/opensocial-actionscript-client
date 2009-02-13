package com.nextgenapp.opensocial
{
	public class FetchPersonAppDataRequest extends Request
	{
		public var keys:Array = [];
		
		public function FetchPersonAppDataRequest(idSpec:IdSpec, keys:Array, optParam:Object)
		{
			super(Request.PERSON_APP_DATA_REQUEST);
			this.idspec = idSpec;
			this.keys = keys;
			this.opt_params = optParam;
			this.keys = keys;
		}
		
	}
}