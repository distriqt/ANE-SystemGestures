
On certain iOS devices there is a visual home indicator for returning to the home screen. This appears as a white bar towards the bottom of the screen.

The system default is for this indicator to be shown at all times however you can hide the indicator by calling the `setPrefersHomeIndicatorAutoHidden()` function:

```as3
SystemGestures.service.setPrefersHomeIndicatorAutoHidden( true );
```

This will indicate that the system is allowed to hide the visual indicator for returning to the Home screen.

This is not a guarantee that the indicator will be hidden, just advising the system that it should hide the indicator when appropriate.

> The system takes your preference into account, but returning YES is not a guarantee that an indicator will be hidden.



Also be aware that there are Apple guidelines around this indicator, basically:

- avoid controls around the indicator;
- don't add any adornments or attempt to change it's appearance;
- generally show the indicator unless you have a passive viewing experience (eg video, photos etc)

