/**
 * MySpaceDataRequest - MySpace implementation of the DataRequest
 * 
 * @author Aaron Tong
 */
package com.nextgenapp.opensocial.myspace
{
	import com.nextgenapp.opensocial.Container;
	import com.nextgenapp.opensocial.DataRequest;
	import com.nextgenapp.opensocial.dataRequest.PeopleRequestFields;
	import com.nextgenapp.opensocial.Request;
	import com.nextgenapp.opensocial.WorkRequest;
	import com.nextgenapp.opensocial.IdSpec;
	
	import flash.external.ExternalInterface;

	public class MySpaceDataRequest extends DataRequest
	{
		private var _workRequest:Array = new Array();
		
		private var _container:Container = null;
		
		private var _xmlFunctions:MySpaceXMLOS = null;
		
		public function MySpaceDataRequest()
		{
			_container = Container.instance;
			_xmlFunctions = _container.xmlFactory as MySpaceXMLOS;
		}

		public override function add(request:Object, opt_key:String=null):void
		{
			//For now, we don't support batching.
			if ( request is Request && _workRequest.length < 1){
				var r:Request = request as Request;
				_workRequest.push(new WorkRequest(r, opt_key));
			}else {
				throw new Error("Request must be of type Request class!");
			}
		}
		
		public override function send(callback:Function):void
		{
			var obj:Object = new Object();
			//set the flash object name
			obj.name = _container.appId;
			obj.params = new Object();
			//set the parameters
			var wr:WorkRequest = _workRequest[0] as WorkRequest;
			var r:Request = wr.request;
			//check what type of request
			switch (r.type){
			case Request.PERSON_REQUEST:
				var optFields:Array = r.opt_params as Array;
				obj.params[com.nextgenapp.opensocial.DataRequest.PeopleRequestFields.PROFILE_DETAILS] = optFields;
				//check to see if this is owner or viewer
				obj.view = r.id;
				//Register callback with MySpaceCallback
				MySpaceCallback.register(MySpaceCallback.FETCH_PERSON, callback);
				//Add the callback
				ExternalInterface.addCallback("fetchPersonRequestCallback", MySpaceCallback.newFetchPersonCallback);
				//Make the call
				ExternalInterface.call(_xmlFunctions.fetchPersonRequest, obj);
			break;
			default:
				throw new Error("Unsupported Request Type");
			}//switch
		}
		
		public override function newFetchActivitiesRequest(idSpec:IdSpec, optParams:Object=null):Object
		{
			return null;
		}
		
		public override function newFetchPeopleRequest(idSpec:IdSpec, optParams:Object=null):Object
		{
			return null;
		}
		
		public override function newFetchPersonAppDataRequest(idSpec:IdSpec, keys:Array, optParam:Object=null):Object
		{
			return null;
		}
		
		public override function newFetchPersonRequest(id:String, optParams:Object=null):Object
		{
			return new Request(Request.PERSON_REQUEST, optParams, id);
		}
		
		public override function newRemovePersonAppDataRequest(id:String, key:Array):Object
		{
			return null;
		}
		
		public override function newUpdatePersonAppDataRequest(id:String, key:String, value:String):Object
		{
			return null;
		}
		
	}
}