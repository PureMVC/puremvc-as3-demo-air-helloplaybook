/*
	PureMVC AS3 / AIR / Blackberry Playbook Demo - HelloPlaybook
	By Cliff Hall <clifford.hall@puremvc.org>
	Copyright(c) 2010, Some rights reserved.
 */
package 
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	import org.puremvc.as3.demos.air.helloplaybook.ApplicationFacade;
	
	import qnx.ui.buttons.Button;
	import qnx.ui.slider.Slider;

	[SWF(width="1024", height="600", backgroundColor="#cccccc", frameRate="30")]
	public class HelloPlaybook extends Sprite
	{
		public function HelloPlaybook()
		{
			
			
			
			var myFormat:TextFormat = new TextFormat();
			myFormat.font = "Arial"
			myFormat.color = 0xAA0000;   
			myFormat.size = 24;  
			myFormat.italic = true;  
			myFormat.align = "center";

			var text:TextField = new TextField();
			text.width = 200;
			text.text = "Close";
			text.setTextFormat(myFormat);

			var closeButton:Button = new Button();
			closeButton.width = 200;
			closeButton.addChild(text);		
			closeButton.addEventListener(MouseEvent.CLICK, closeWindow);
			closeButton.x = stage.stageWidth - closeButton.width;
			closeButton.y = stage.stageHeight - closeButton.height;
			
			addChild(closeButton);

			stage.nativeWindow.visible = true;
			ApplicationFacade.getInstance().startup( this.stage );
		}

		private function closeWindow(event:MouseEvent):void{
			stage.nativeWindow.close();
		}
	}
}
