package opensocial
{
	import MyOpenSpace.MySpaceContainer;
	
	import flash.utils.describeType;
	
	import opensocial.Environment.ObjectType;
	
	/**
	 * Base interface for all environment objects.
	 *
	 */
	public class Environment
	{
		private var _domain:String;
		private var _surface:Surface;
		private var _supportedSurfaces:Array;
		private var _supportedFields:Array;
		private var _params:Array;
		
		public static const ObjectType:Class = opensocial.Environment.ObjectType;
		
		/**
		 * Environment constructor. 
		 * @param domain The domain of the environment.
		 * @param surface Current surface.
		 * @param supportedSurfaces List of surfaces supported  by the gadget.
		 * @param supportedFields Collection of supported fields.
		 * @param params Gadget parameters.
		 * 
		 */		
		public function Environment(domain:String, surface:Surface, supportedSurfaces:Array, supportedFields:Array, params:Array)
		{
			super();
			_domain = domain;
			_surface = surface;
			_supportedSurfaces = supportedSurfaces;	
			_supportedFields = supportedFields;
			_params = params;
		}
		
		/**
		 * Returns the current domain — for example, "orkut.com" or "myspace.com".  
		 * @return 
		 * 
		 */		
		public function getDomain():String {
			return _domain;
		}
		
		/**
		 * Returns the current surface.  
		 * @return 
		 * 
		 */		
		public function getSurface():Surface {
			return _surface;
		}
		
		/**
		 * Returns an array of all the supported surfaces. 
		 * @return All supported surfaces.
		 * 
		 */		
		public function getSupportedSurface():Array {
			return _supportedSurfaces;
		}
		
		/**
		 * Returns the parameters passed into this gadget. 
		 * @return The parameter map.
		 * 
		 */		
		public function getParams():Array {
			return _params;
		}
		
		/**
		 * Returns true if the specified field is supported in this container on the given object type. 
		 * @param objectType The object type to check for the field
		 * @param fieldName The name of the field to check for.
		 * @return rue if the field is supported on the specified object type.
		 * 
		 */				
		public function supportsField(objectType:String, fieldName:String):Boolean {
			var supported:Array = _supportedFields[objectType] || [];
			return !!supported[fieldName];
		}

		/**
		 * Returns true if the specified function is supported in this container. 
		 * @param functionName The function name.
		 * @return True if this container supports the function.
		 * 
		 */		
		public function hasCapabaility(functionName:String):Boolean {
			var fName:String = functionName.substr(functionName.lastIndexOf(".") + 1, functionName.length);
			//
			var osContainer:Boolean = functionName.search("opensocial") != -1;
			var cls:Class = osContainer ? opensocial.Container : MyOpenSpace.MySpaceContainer;
			var os:XML = describeType(cls);
			var methods:XMLList = os.factory.method;
			for(var i:int = 0; i < methods.length(); i++) {
				if(methods[i].@name.toString() == fName)
					return true;
			}
			return false;
		}
	}
}