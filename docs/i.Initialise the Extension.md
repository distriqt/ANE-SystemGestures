
## Initialising the Extension

There is nothing particular required to initialise this extension. 


### Support

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


