﻿/*
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */

package {
  
import flash.display.Loader;
import flash.display.MovieClip;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.net.URLRequest;
import flash.text.TextField;
import flash.text.TextFormat;

import org.opensocial.client.base.*;
import org.opensocial.client.core.*;
import org.opensocial.client.features.*;
import org.opensocial.client.jswrapper.*;
import org.opensocial.client.util.*;

/**
 * Sample Application using the OpenSocial AS3 Client Lirary in Adobe Flash IDE.
 * Build the SampleApp.fla in Adobe Flash IDE to swf file and it works with the gadget spec XML 
 * (//sample/SampleApp.xml).
 * 
 * <p>
 * Usage:<br>
 * 1. Create a JsWrapperClient instance.
 * <br> 
 * 2. Add a eventhandler for READY event and call the start() method.
 * <br>
 * 3. When the client is ready, use the any of the <code>AsyncRequest</code> objects and 
 * <code>SyncHelper</code> objects to interact with OpenSocial API. All these are located in
 * <code>org.opensocial.client.features</code> package.
 * <br>
 * </p>
 * 
 * @author yiziwu@google.com (Yizi Wu)
 * @author chaowang@google.com (Jacky Wang)
 */
public class SampleApp extends MovieClip {

  private var logger:Logger = new Logger(SampleApp);
  private var client:JsWrapperClient;
  private var helper:SyncHelper;

  public function SampleApp() {
    prepareBtns();
    
    // Create the output box for information displaying
    var printer:TextFieldPrinter = new TextFieldPrinter(2, 120, 500, 330);
    addChild(printer);
    Logger.initialize(printer);
    
    // Initialize Client and start
    client = new JsWrapperClient("opensocial.flash");
    client.addEventListener(OpenSocialClientEvent.CLIENT_READY, onReady);
    client.start();
    logger.log(new Date());
    
    helper = new SyncHelper(client);
  }

  private function onReady(event:OpenSocialClientEvent):void {
    logger.log("Domain: " + helper.getDomain());
    logger.log("ContainerDomain: " + helper.getContainerDomain());
    logger.log("CurrentView: " + helper.getCurrentView());
    logger.log("Client Ready.");
  }
  
  // -------------------------------------------------------------
  //  Demo Actions
  // -------------------------------------------------------------
  
  // ----------------- Fetch Me ------------------
  private function fetchMe():void {
    var req:AsyncDataRequest = new AsyncDataRequest(
        Feature.PEOPLE_GET,
        new PeopleRequestOptions()
            .setUserId("@me")
            .setGroupId("@self"));
    req.addEventListener(ResponseItemEvent.COMPLETE, fetchMeEventHandler);
    req.send(client);
  }
  
  private function fetchMeEventHandler(event:ResponseItemEvent):void {
    var p:Person = event.response.getData();
    logger.log(p.getDisplayName());
    drawPerson(p, 0);
  }

  
  // ----------------- Fetch Friends ------------------
  private function fetchFriends():void {
    var req:AsyncDataRequest = new AsyncDataRequest(
        Feature.PEOPLE_GET,
        new PeopleRequestOptions()
            .setUserId("@me")
            .setGroupId("@friends")
            .setCount(5)
            .setStartIndex(0));
    req.addEventListener(ResponseItemEvent.COMPLETE, fetchFriendsEventHandler);
    req.send(client);
  }

  private function fetchFriendsEventHandler(event:ResponseItemEvent):void {
    var c:Collection = event.response.getData();
    logger.log(c.toDebugString());
    var arr:Array = c.getArray();
    for (var i:int = 0; i < arr.length; i++) {
      var p:Person = arr[i];
      logger.log(p.getDisplayName());
      drawPerson(p, i + 1);
    }
    
    if (c.getRemainingSize() > 0) {
      var req:AsyncDataRequest = event.target as AsyncDataRequest;
      (req.getOptions() as PeopleRequestOptions).setStartIndex(c.getNextOffset());
      req.send(client);
    }
  }
  
  
  // ----------------- Send Message ------------------
  private function sendMessage():void {
    // the change for myspace. myspace is not support Message object's type equal to null.
    var message:Message = Message.newInstance("Hello World...", "My new message.", Message.Type.NOTIFICATION);
    logger.log(message.toRawObject());
    var req:AsyncDataRequest = new AsyncDataRequest(
        Feature.REQUEST_SEND_MESSAGE,
        new UIRequestOptions()
            .setRecipientIds(["@viewer"])
            .setMessage(message));
    req.addEventListener(ResponseItemEvent.COMPLETE, sendMessageEventHandler);
    req.addEventListener(ResponseItemEvent.ERROR, sendMessageEventErrorHandler);
    req.send(client);
  }
  
  private function sendMessageEventHandler(event:ResponseItemEvent):void {
    logger.log("msg sent.");
  }
  private function sendMessageEventErrorHandler(event:ResponseItemEvent):void {
    logger.log("msg sending failed: " + event.response.getErrorMessage());
  }
  
  
  // ----------------- Create Activity ------------------
  private function createActivity():void {
    var activity:Activity = Activity.newInstance("My new activity!", "Hello World...");
    // the change for myspace. myspace's Activity object need set 'TITLE_ID'.
    logger.log(activity.toRawObject());
    var req:AsyncDataRequest = new AsyncDataRequest(
        Feature.REQUEST_CREATE_ACTIVITY,
        new UIRequestOptions()
            .setActivity(activity));
    req.addEventListener(ResponseItemEvent.COMPLETE, createActivityEventHandler);
    req.addEventListener(ResponseItemEvent.ERROR, createActivityEventErrorHandler);
    req.send(client);
  }

  private function createActivityEventHandler(event:ResponseItemEvent):void {
    logger.log("activity created");
  }
  private function createActivityEventErrorHandler(event:ResponseItemEvent):void {
    logger.log("activity creation failed: " + event.response.getErrorMessage());
  }
  
  
  // ----------------- Make Request ------------------
  private function makeRequest():void {
    var req:ProxiedRequest = new ProxiedRequest(
        "http://www.google.com/crossdomain.xml",
        new ProxiedRequestOptions()
            .setContentType(GadgetsIo.ContentType.TEXT));
    req.addEventListener(ProxiedRequestEvent.COMPLETE, makeRequestEventHandler);
    req.addEventListener(ProxiedRequestEvent.ERROR, makeRequestEventErrorHandler);
    req.send(client);
  }
  
  private function makeRequestEventHandler(event:ProxiedRequestEvent):void {
    logger.log(event.response.getData());
  }
  private function makeRequestEventErrorHandler(event:ProxiedRequestEvent):void {
    logger.log("make request failed: " + event.response.getRC() + "|" + 
                event.response.getText());
  }


  // ----------------- Call RPC ------------------
  private function callRpc():void {
    // To use this, you need to first register the rpc service with name "srv-parent" on 
    // container side. If you are using firefox+firebug and looking on a shindig container,
    // before clicking the "Call Rpc" button in the flash to call this method, copy+paste the 
    // following codes to the console window:
    // 
    // <code>
    // gadgets.rpc.register("srv-parent",function(){console.log(arguments);return "'srv-parent' returned."});
    // </code>
    var req:RPCRequest = new RPCRequest(null, "srv-parent", "abc", 123, {'xyz':456});
    req.addEventListener(RPCRequestEvent.RPC_CALLBACK, callRpcEventHandler);
    req.send(client);
  }

  private function callRpcEventHandler(event:RPCRequestEvent):void {
    logger.log("--- invoked by the returning of 'srv-parent' ---");
    logger.log(event.returnValue);
  }

  
  // ----------------- Register RPC Service ------------------
  private function registerService():void {
    // To use this, you need to make a rpc call to "srv-app" from container side. If you are 
    // using firefox+firebug and shindig container, click the "Register Srv" button in the 
    // flash to call this method, then copy+paste the following codes to the console window
    // to test the rpc. 
    // ("remote_iframe_0" assumes this flash app is the first app on the page)
    // 
    // <code>
    // gadgets.rpc.call("remote_iframe_0","srv-app",function(r){console.log(r);},"abc", 123, {'xyz':456});
    // </code>
    var srv:RPCService = new RPCService("srv-app");
    srv.register(client);
    srv.addEventListener(RPCServiceEvent.RPC_SERVICE, serviceEventHandler);
  }
  
  private function serviceEventHandler(event:RPCServiceEvent):void {
    logger.log("--- invoked by 'srv-app' get called ---");
    logger.log(event.params);
    event.callback("'srv-app' returned.");
  }


  // ----------------- Share App ------------------
  private function shareApp(p:Person):void {
    // To use this, you need First run "Fetch Friends" or "Fetch Me" and then click People.
    var message:Message = Message.newInstance("Hey [recipient]! [sender] wants you to add [app]. It's way awesome!", "A fun way to view your profile!");
    logger.log(message.toRawObject());
 
    var req:AsyncDataRequest = new AsyncDataRequest(
        Feature.REQUEST_SHARE_APP,
        new UIRequestOptions()
            .setRecipientIds([p.getId()])
            .setReason(message));
     req.addEventListener(ResponseItemEvent.COMPLETE, shareAppEventHandler);
     req.addEventListener(ResponseItemEvent.ERROR, shareAppEventErrorHandler);
     req.send(client);
  }
  
  private function shareAppEventHandler(event:ResponseItemEvent):void {
    logger.log("msg sent.");
  }
  private function shareAppEventErrorHandler(event:ResponseItemEvent):void {
    logger.log("msg sending failed: " + event.response.getErrorMessage());
  }
  // ----------------- Batch Request------------------
  private function batchRequest():void {
    var batch:BatchRequest = new BatchRequest();
    var req:AsyncDataRequest = new AsyncDataRequest(
    Feature.PEOPLE_GET,
    new PeopleRequestOptions()
        .setUserId("@me")
        .setGroupId("@self"));

    req.addEventListener(ResponseItemEvent.COMPLETE, batchFetchMeEventHandler);
    req.addEventListener(ResponseItemEvent.ERROR, batchFetchMeEventErrorHandler);

        
    batch.add(req, "meProfile");
 
    req = new AsyncDataRequest(
    Feature.PEOPLE_GET,
    new PeopleRequestOptions()
        .setUserId("@me")
        .setGroupId("@friends")
        .setCount(2)
        .setStartIndex(0));

    req.addEventListener(ResponseItemEvent.COMPLETE, batchFetchFriendsEventHandler);
    req.addEventListener(ResponseItemEvent.ERROR, batchFetchFriendsEventErrorHandler);
        
    batch.add(req, "friendList");

    batch.addEventListener(ResponseItemEvent.COMPLETE, batchDataRequestEventHandler);
    batch.addEventListener(ResponseItemEvent.ERROR, batchDataRequestErrorHandler);
    batch.send(client);
  }

  private function batchDataRequestEventHandler(event:ResponseItemEvent):void {
    logger.log("===============  Batch Success   ================");
    var p:Person = event.response.getData("meProfile");
    logger.log("meProfile ===============  " + p.getDisplayName());
    
    var c:Collection = event.response.getData("friendList");
    var arr:Array = c.getArray();
    for (var i:int = 0; i < arr.length; i++) {
      var person:Person = arr[i];
      logger.log("friendList ===============  " + person.getDisplayName());
    }

    logger.log("===============  Batch Success   ================");
  }
  
  private function batchDataRequestErrorHandler(event:ResponseItemEvent):void {
    logger.log("===============  Batch Error   ================");
    logger.log(event.response.getErrorMessage());
    logger.log("===============  Batch Error   ================");
  }
  
  private function batchFetchMeEventHandler(event:ResponseItemEvent):void {
    var p:Person = event.response.getData();
    logger.log(p.getDisplayName());
    drawPerson(p, 0);
  }  
  
  private function batchFetchMeEventErrorHandler(event:ResponseItemEvent):void {
    logger.log("fetch me failed: " + event.response.getErrorMessage());
  }

  private function batchFetchFriendsEventHandler(event:ResponseItemEvent):void {
    var c:Collection = event.response.getData();
    logger.log(c.toDebugString());
    var arr:Array = c.getArray();
    for (var i:int = 0; i < arr.length; i++) {
      var p:Person = arr[i];
      logger.log(p.getDisplayName());
      drawPerson(p, i + 1);
    }
    
    if (c.getRemainingSize() > 0) {
      var req:AsyncDataRequest = event.target as AsyncDataRequest;
      (req.getOptions() as PeopleRequestOptions).setStartIndex(c.getNextOffset());
      req.send(client);
    }
  }

  private function batchFetchFriendsEventErrorHandler(event:ResponseItemEvent):void {
    logger.log("fetch friends failed: " + event.response.getErrorMessage());
  }

  // -------------------------------------------------------------
  //  Helper functions for action and display
  // -------------------------------------------------------------
  private function prepareBtns():void {
  
    if (this['fetchMeBtn']) {
      var btn1:TextField = this['fetchMeBtn'] as TextField;
      btn1.addEventListener(MouseEvent.CLICK, function(event:MouseEvent):void {
        fetchMe();
      });
    }
    
    if (this['fetchFriendsBtn']) {
      var btn2:TextField = this['fetchFriendsBtn'] as TextField;
      btn2.addEventListener(MouseEvent.CLICK, function(event:MouseEvent):void {
        fetchFriends();
      });
    }
    
    if (this['sendMessageBtn']) {
      var btn3:TextField = this['sendMessageBtn'] as TextField;
      btn3.addEventListener(MouseEvent.CLICK, function(event:MouseEvent):void {
        sendMessage();
      });
    }
    
    if (this['createActivityBtn']) {
      var btn4:TextField = this['createActivityBtn'] as TextField;
      btn4.addEventListener(MouseEvent.CLICK, function(event:MouseEvent):void {
        createActivity();
      });
    }
    
    if (this['makeRequestBtn']) {
      var btn5:TextField = this['makeRequestBtn'] as TextField;
      btn5.addEventListener(MouseEvent.CLICK, function(event:MouseEvent):void {
        makeRequest();
      });
    }

    if (this['callRpcBtn']) {
      var btn6:TextField = this['callRpcBtn'] as TextField;
      btn6.addEventListener(MouseEvent.CLICK, function(event:MouseEvent):void {
        callRpc();
      });
    }

    if (this['registerSrvBtn']) {
      var btn7:TextField = this['registerSrvBtn'] as TextField;
      btn7.addEventListener(MouseEvent.CLICK, function(event:MouseEvent):void {
        registerService();
      });
    }
	
    if (this['batchRequestBtn']) {
      var btn8:TextField = this['batchRequestBtn'] as TextField;
      btn8.addEventListener(MouseEvent.CLICK, function(event:MouseEvent):void {
        batchRequest();
      });
    }
  }

  private function drawPerson(person:Person, index:int):void {
    var txtfmt:TextFormat = new TextFormat();
    txtfmt.size = 11;
    txtfmt.font = "arial";
    txtfmt.color = 0xFFFFFF;

    var name:TextField = new TextField();
    name.x = 2;
    name.y = 20;
    name.defaultTextFormat = txtfmt;
    name.text = person.getDisplayName();

    var box:Sprite = new Sprite();
    box.x = 2 + (index % 3) * 180;
    box.y = (Math.floor(index / 3)) * 70 + 20;
    box.addChild(name);

    addChild(box);

    try {
      var url:String = person.getThumbnailUrl();
      //logger.log(url);
      if (url != null) {
        var request:URLRequest = new URLRequest(url);
        var thumb:Loader = new Loader();
        box.addChild(thumb);
        thumb.x = 2;
        thumb.y = 20 + 2;
        thumb.load(request);
        
        thumb.contentLoaderInfo.addEventListener(Event.COMPLETE, 
            function(event:Event):void {
              thumb.width = 32;
              thumb.height = 32;
            }, false, 0, true);
            
        box.addEventListener(MouseEvent.CLICK, 
            function(event:Event):void {
			  shareApp(person);
            }, false, 0, true);
      }
    } catch (e:Error) {
      logger.error(e);
    }
  }
  
}
}
