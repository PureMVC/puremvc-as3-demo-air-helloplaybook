/*
	PureMVC AS3 / AIR / Blackberry Playbook Demo - HelloPlaybook
	By Cliff Hall <clifford.hall@puremvc.org>
	Copyright(c) 2010, Some rights reserved.
 */
package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	import org.puremvc.as3.demos.air.helloplaybook.ApplicationFacade;
	
	import qnx.ui.buttons.Button;

	[SWF(width="1024", height="600", backgroundColor="#cccccc", frameRate="30")]
	public class HelloPlaybook extends Sprite
	{
		public static const SCALE_UP:String = "scaleUp";
		public static const SCALE_DN:String = "scaleDn";

		public function HelloPlaybook()
		{			
			// The Text format used for all buttons
			var myFormat:TextFormat = new TextFormat();
			myFormat.font = "Arial"
			myFormat.color = 0xAA0000;   
			myFormat.size = 24;  
			myFormat.italic = true;  
			myFormat.align = "center";

			// Close button text
			var closeText:TextField = new TextField();
			closeText.width = 100;
			closeText.text = "Close";
			closeText.setTextFormat(myFormat);

			// Close button
			var closeButton:Button = new Button();
			closeButton.width = 100;
			closeButton.addChild(closeText);		
			closeButton.addEventListener(MouseEvent.CLICK, closeWindow);
			closeButton.x = stage.stageWidth - closeButton.width;
			closeButton.y = stage.stageHeight - closeButton.height;
			addChild(closeButton);

			// Scale up button text			
			var upText:TextField = new TextField();
			upText.width = 50;
			upText.text = "+";
			upText.setTextFormat(myFormat);
			
			// Scale up button			
			var scaleUpButton:Button = new Button();
			scaleUpButton.width = 50;
			scaleUpButton.addChild(upText);		
			scaleUpButton.addEventListener(MouseEvent.CLICK, scaleUp);
			scaleUpButton.x = closeButton.x - scaleUpButton.width;
			scaleUpButton.y = closeButton.y;
			addChild(scaleUpButton);

			// Scale down button text			
			var dnText:TextField = new TextField();
			dnText.width = 50;
			dnText.text = "-";
			dnText.setTextFormat(myFormat);
			
			// Scale down button			
			var scaleDnButton:Button = new Button();
			scaleDnButton.width = 50;
			scaleDnButton.addChild(dnText);		
			scaleDnButton.addEventListener(MouseEvent.CLICK, scaleDown);
			scaleDnButton.x = scaleUpButton.x - scaleDnButton.width;
			scaleDnButton.y = scaleUpButton.y;
			addChild(scaleDnButton);

			// show the window contents
			stage.nativeWindow.visible = true;
			
			// startup the PureMVC apparatus
			ApplicationFacade.getInstance().startup( this.stage );
		}

		private function closeWindow(event:MouseEvent):void{
			stage.nativeWindow.close();
		}

		private function scaleUp(event:MouseEvent):void{
			stage.dispatchEvent(new Event(SCALE_UP,true));
		}

		private function scaleDown(event:MouseEvent):void{
			stage.dispatchEvent(new Event(SCALE_DN,true));
		}
	
		
		
		
		
	}
}
