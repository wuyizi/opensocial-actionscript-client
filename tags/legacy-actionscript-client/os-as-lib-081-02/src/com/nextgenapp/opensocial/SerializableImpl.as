package com.nextgenapp.opensocial
{
	import flash.utils.describeType;
	
	/**
	 * General base implementation of serializable. 
	 * may be used as baseclass for other data class that need to 
	 * convert itself back and forth to a a generic Object.  
	 */
	public class SerializableImpl implements Serializable
	{
		public function SerializableImpl()
		{
		}

		/**
		 * convert this object to a generic object with the same properties.  
		 */
		public function write():Object
		{
			// this may only work fordynamic object.  we may need to use describeType() instead.  
			var obj:Object = new Object();
			
			// example of output of describeType
			/*
			describeType(instance)=
			<type name="tempclass" base="Object" isDynamic="false" isFinal="false" isStatic="false">
			  <extendsClass type="Object"/>
			  <variable name="var2" type="String"/>
			  <variable name="var1" type="int"/>
			  <method name="test" declaredBy="tempclass" returnType="void"/>
			  <constant name="CONST2" type="int"/>
			</type>
			
			 describeType(class)=
			<type name="tempclass" base="Class" isDynamic="true" isFinal="true" isStatic="true">
			  <extendsClass type="Class"/>
			  <extendsClass type="Object"/>
			  <variable name="staticVar1" type="String"/>
			  <constant name="STATIC_CONST1" type="String"/>
			  <accessor name="prototype" access="readonly" type="*" declaredBy="Class"/>
			  <factory type="tempclass">
			    <extendsClass type="Object"/>
			    <variable name="var2" type="String"/>
			    <variable name="var1" type="int"/>
			    <method name="test" declaredBy="tempclass" returnType="void"/>
			    <constant name="CONST2" type="int"/>
			  </factory>
			</type>
			*/
			var types:XML = describeType(this);
			for each (var varDefinition:XML in types.variable) {
				obj[varDefinition.@name] = this[varDefinition.@name];
			}
			return obj;
		}
		
		/**
		 * read this generic object's properties into this object.  
		 */
		public function read(obj:Object):Boolean
		{
			for (var propName:String in obj) {
				this[propName] = obj[propName];
			}
			return true;
		}
		
	}
}