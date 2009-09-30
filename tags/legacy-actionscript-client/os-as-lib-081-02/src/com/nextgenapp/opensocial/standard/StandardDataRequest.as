/**
 * implementation of the DataRequest that conforms to opensocial standard.  Conforms to spec 0.8.
 * 
 * @author sol wu & Aaron Tong 
 */
package com.nextgenapp.opensocial.standard
{
	import com.nextgenapp.opensocial.Container;
	import com.nextgenapp.opensocial.DataRequest;
	import com.nextgenapp.opensocial.FetchPersonAppDataRequest;
	import com.nextgenapp.opensocial.IdSpec;
	import com.nextgenapp.opensocial.Request;
	import com.nextgenapp.opensocial.UpdatePersonAppDataRequest;
	import com.nextgenapp.opensocial.WorkRequest;
	import com.nextgenapp.opensocial.dataRequest.PeopleRequestFields;
	
	import flash.external.ExternalInterface;

	public class StandardDataRequest extends DataRequest
	{
		private var _workRequest:Array = new Array();
		
		private var _container:Container = null;
		
		private var _xmlFunctions:StandardXMLOS = null;
		
		public function StandardDataRequest()
		{
			_container = Container.instance;
			_xmlFunctions = _container.xmlFactory as StandardXMLOS;
		}

		public override function add(request:Object, opt_key:String=null):void
		{
			//For now, we don't support batching.
			if ( request is Request && _workRequest.length < 1){
				var req:Request = request as Request;
				_workRequest.push(new WorkRequest(req, opt_key));
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
			var req:Request = wr.request;
			var idSpec:IdSpec = req.idspec;
			//check what type of request
			switch (req.type){
			case Request.PERSON_REQUEST:
				var optFields:Array = req.opt_params as Array;
				obj.params[com.nextgenapp.opensocial.dataRequest.PeopleRequestFields.PROFILE_DETAILS] = optFields;
				//check to see if this is owner or viewer
				obj.view = req.id;
				//Register callback with MySpaceCallback
				StandardCallback.register(StandardCallback.FETCH_PERSON, callback);
				//Add the callback
				ExternalInterface.addCallback("fetchPersonRequestCallback", StandardCallback.newFetchPersonCallback);
				//Make the call
				ExternalInterface.call(_xmlFunctions.fetchPersonRequest, obj);
			break;
			
			case Request.PEOPLE_REQUEST:
				//check if there is optional parameter
				if ( wr.opt_key != null ){
					//this is key field in response data
					obj.drAddOptKey = wr.opt_key;
				}else {
					obj.drAddOptKey = "PEOPLE_REQUEST";
				}
				//throw exception if no idSpec
				if ( idSpec == null ){
					throw new Error("IdSpec cannot be null for PeopleRequest!");
				}
				obj.IdSpec = new Object();
				//set the user for IdSpec
				var value:Object = idSpec.getField(com.nextgenapp.opensocial.IdSpec.Field.USER_ID);
				if ( value == null ){
					throw new Error("User value for IdSpec cannot be null!");
				}
				obj.IdSpec[com.nextgenapp.opensocial.IdSpec.Field.USER_ID] = value;
				//set the group for IdSpec
				value = idSpec.getField(com.nextgenapp.opensocial.IdSpec.Field.GROUP_ID);
				if ( value == null ){
					throw new Error("Group value cannot be null for IdSpec!");
				}
				obj.IdSpec[com.nextgenapp.opensocial.IdSpec.Field.GROUP_ID] = value;
				//set the network distance for IdSpec
				value = idSpec.getField(com.nextgenapp.opensocial.IdSpec.Field.NETWORK_DISTANCE);
				if ( value != null ){
					obj.IdSpec[com.nextgenapp.opensocial.IdSpec.Field.NETWORK_DISTANCE] = value;
				}
				//set the optional parameters
				var peoReqParams:Object = req.opt_params;
				obj.params = peoReqParams;
				
				//Register callback with MySpaceCallback
				StandardCallback.register(StandardCallback.FETCH_PEOPLE, callback);
				//Add the callback
				ExternalInterface.addCallback("fetchPeopleRequestCallback", StandardCallback.newFetchPeopleCallback);
				//Make the call
				ExternalInterface.call(_xmlFunctions.fetchPeopleRequest, obj);
			break;
			
			case Request.PERSON_APP_DATA_REQUEST:
				var fpadReq:FetchPersonAppDataRequest = req as FetchPersonAppDataRequest;
				//Register callback 
				StandardCallback.register(StandardCallback.FETCH_PERSON_APP_DATA, callback);
				//Add the callback
				ExternalInterface.addCallback("fetchPersonAppDataRequestCallback", StandardCallback.newFetchPersonAppDataCallback);
				ExternalInterface.call(StandardFetchPersonAppDataRequestJs.fetchPersonAppDataRequest, ExternalInterface.objectID, wr.opt_key, fpadReq.idspec.write(), fpadReq.keys, fpadReq.opt_params);
			break;
			
			case Request.UPDATE_PERSON_APP_DATA_REQUEST:
				var upadReq:UpdatePersonAppDataRequest = req as UpdatePersonAppDataRequest;
				//Register callback 
				StandardCallback.register(StandardCallback.UPDATE_PERSON_APP_DATA, callback);
				//Add the callback
				ExternalInterface.addCallback("updatePersonAppDataRequestCallback", StandardCallback.newUpdatePersonAppDataCallback);
				ExternalInterface.call(StandardUpdatePersonAppDataJs.updatePersonAppDataRequest, ExternalInterface.objectID, upadReq.id, upadReq.key, upadReq.value);
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
			return new Request(Request.PEOPLE_REQUEST, optParams, null, idSpec);
		}
		
		public override function newFetchPersonAppDataRequest(idSpec:IdSpec, keys:Array, optParam:Object=null):Object
		{
			return new FetchPersonAppDataRequest(idSpec, keys, optParam);
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
			return new UpdatePersonAppDataRequest(id, key, value);
		}
		
	}
}