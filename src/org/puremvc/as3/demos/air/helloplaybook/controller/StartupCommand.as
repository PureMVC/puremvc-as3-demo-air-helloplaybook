/*
	PureMVC AS3 / AIR / Blackberry Playbook Demo - HelloPlaybook
	By Cliff Hall <clifford.hall@puremvc.org>
	Copyright(c) 2010, Some rights reserved.
 */
package org.puremvc.as3.demos.air.helloplaybook.controller
{
    import flash.display.Stage;
    import org.puremvc.as3.interfaces.ICommand;
    import org.puremvc.as3.interfaces.INotification;
    import org.puremvc.as3.patterns.command.SimpleCommand;
    
    import org.puremvc.as3.demos.air.helloplaybook.ApplicationFacade;
    import org.puremvc.as3.demos.air.helloplaybook.view.StageMediator;
    import org.puremvc.as3.demos.air.helloplaybook.model.SpriteDataProxy;

    public class StartupCommand extends SimpleCommand implements ICommand
    {
        /**
         * Register the Proxies and Mediators.
         * 
         * Get the View Components for the Mediators from the app,
         * which passed a reference to itself on the notification.
         */
        override public function execute( note:INotification ) : void    
        {
			facade.registerProxy(new SpriteDataProxy());
	    	var stage:Stage = note.getBody() as Stage;
            facade.registerMediator( new StageMediator( stage ) );
			sendNotification( ApplicationFacade.STAGE_ADD_SPRITE );
        }
    }
}