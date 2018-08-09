
## General Gestures

There are a few gestures that a consistent across iOS and tvOS

- `NativeGestureEvent.GESTURE_SWIPE_UP`: Dispatched when the user swipes up on the screen or on the Apple remote;
- `NativeGestureEvent.GESTURE_SWIPE_DOWN`: Dispatched when the user swipes down on the screen or on the Apple remote;
- `NativeGestureEvent.GESTURE_SWIPE_LEFT`: Dispatched when the user swipes left on the screen or on the Apple remote;
- `NativeGestureEvent.GESTURE_SWIPE_RIGHT`: Dispatched when the user swipes right on the screen or on the Apple remote;


## Apple Remote Buttons

There are a few native gesture events specific to the Apple remote button presses including:

- `NativeGestureEvent.SELECT`: Dispatched when the touch area on the remote is presssed;
- `NativeGestureEvent.MENU`: Dispatched when the **Menu** button on the remote is presssed; 
- `NativeGestureEvent.PLAYPAUSE`: Dispatched when the **Play/Pause** button on the remote is presssed;



## Listening for events

Listening for these gesture events is the same as any other event listener. Use the `addEventListener` function on the SystemGestures instance:


```as3
SystemGestures.service.addEventListener( NativeGestureEvent.GESTURE_SWIPE_DOWN, swipeHandler );


function swipeHandler( event:NativeGestureEvent ):void
{
    trace( "swipe: " + event.type );
}
```


Note: you shouldn't add these listeners in the first frame / class constructor on iOS. There appears to be some conflict with AIR on iOS so you should wait around 100 milliseconds from launch before attaching these listeners to ensure consistency.
