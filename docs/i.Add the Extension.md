
## Add the Extension

First step is always to add the extension to your development environment. 
To do this use the tutorial located [here](https://airnativeextensions.github.io/tutorials/getting-started).



## Required ANEs

### Core ANE

The Core ANE is required by this ANE. You must include and package this extension in your application.

The Core ANE doesn't provide any functionality in itself but provides support libraries and frameworks used by our extensions.
It also includes some centralised code for some common actions that can cause issues if they are implemented in each individual extension.

You can access this extension here: [https://github.com/distriqt/ANE-Core](https://github.com/distriqt/ANE-Core).



## Support

Note you should always check whether the extension is supported before making calls. 
This allows you to react to whether the functionality is available on the device.


```as3
try
{
	if (SystemGestures.isSupported)
	{
		// Functionality here
	}
}
catch (e:Error)
{
	trace( e );
}
```

