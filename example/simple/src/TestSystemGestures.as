/**
 *        __       __               __ 
 *   ____/ /_ ____/ /______ _ ___  / /_
 *  / __  / / ___/ __/ ___/ / __ `/ __/
 * / /_/ / (__  ) / / /  / / /_/ / / 
 * \__,_/_/____/_/ /_/  /_/\__, /_/ 
 *                           / / 
 *                           \/ 
 * http://distriqt.com
 *
 * This is a test application for the distriqt extension
 * 
 * @author Michael Archbold & Shane Korin
 * 	
 */
package
{
	import com.distriqt.extension.systemgestures.ScreenEdges;
	import com.distriqt.extension.systemgestures.SystemGestures;
	import com.distriqt.extension.systemgestures.events.NativeGestureEvent;
	
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.utils.setTimeout;
	
	
	[SWF(backgroundColor="#222222")]
	/**	
	 * Sample application for using the SystemGestures Native Extension
	 */
	public class TestSystemGestures extends Sprite
	{
		////////////////////////////////////////////////////////
		//	VARIABLES
		//
		
		private var _text		: TextField;
		
		
		////////////////////////////////////////////////////////
		//	FUNCTIONALITY
		//	
		
		/**
		 * Class constructor
		 */
		public function TestSystemGestures()
		{
			super();
			addEventListener( Event.ADDED_TO_STAGE, addedToStageHandler );
		}
		
		private function addedToStageHandler( event:Event ):void
		{
			init();
		}
		
		private function init():void
		{
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;

			var tf:TextFormat = new TextFormat("_typewriter", 16, 0xFFFFFF );
			_text = new TextField();
			_text.y = 40;
			_text.defaultTextFormat = tf;
			addChild( _text );

			stage.addEventListener( Event.RESIZE, stage_resizeHandler, false, 0, true );
			stage.addEventListener( MouseEvent.CLICK, mouseClickHandler, false, 0, true );
			
			try
			{
				message( "SystemGestures Supported: " + SystemGestures.isSupported );
				message( "SystemGestures Platform:  " + SystemGestures.service.implementation );
				message( "SystemGestures Version:   " + SystemGestures.service.version );
				
				
				setTimeout( function():void {
					if (SystemGestures.isSupported)
					{
						SystemGestures.service.addEventListener( NativeGestureEvent.GESTURE_SWIPE_DOWN, swipeHandler );
						SystemGestures.service.addEventListener( NativeGestureEvent.GESTURE_SWIPE_UP, swipeHandler );
						SystemGestures.service.addEventListener( NativeGestureEvent.GESTURE_SWIPE_LEFT, swipeHandler );
						SystemGestures.service.addEventListener( NativeGestureEvent.GESTURE_SWIPE_RIGHT, swipeHandler );
						SystemGestures.service.addEventListener( NativeGestureEvent.TAP, tapHandler );
						SystemGestures.service.addEventListener( NativeGestureEvent.MENU, tapHandler );
						SystemGestures.service.addEventListener( NativeGestureEvent.SELECT, tapHandler );
						SystemGestures.service.addEventListener( NativeGestureEvent.PLAYPAUSE, tapHandler );
					}
				}, 100 );
			}
			catch (e:Error)
			{
				message( "ERROR::"+e.message );
			}
		}
		
		
		
		//
		//	FUNCTIONALITY
		//
		
		private function message( str:String ):void
		{
			trace( str );
			_text.appendText(str+"\n");
		}
		
		
		//
		//	EVENT HANDLERS
		//
		
		private function stage_resizeHandler( event:Event ):void
		{
			_text.width  = stage.stageWidth;
			_text.height = stage.stageHeight - 100;
		}
		
		
		private function mouseClickHandler( event:MouseEvent ):void
		{
			//
			//	Do something when user clicks screen?
			//
			
			// Home indicator
			message( "setPrefersHomeIndicatorAutoHidden()" );
			SystemGestures.service.setPrefersHomeIndicatorAutoHidden( true );
			
			
			
			// Deferred edges
			if (SystemGestures.isDeferredScreenEdgesSupported)
			{
				message( "getDeferredScreenEdges() = " + SystemGestures.service.getDeferredScreenEdges() );
				
				message( "setDeferredScreenEdges()" );
				SystemGestures.service.setDeferredScreenEdges( ScreenEdges.ALL );
			}
			
			
		}
		
		
		private function swipeHandler( event:NativeGestureEvent ):void
		{
			message( "swipe: " + event.type );
			
			
		}
		
		private function tapHandler( event:NativeGestureEvent ):void
		{
			message( "tap: " + event.type + " ("+event.location.x + ","+event.location.y +")" );
		}
		
	}
}

