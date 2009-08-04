package com.kelvinluck.gmaps.example 
{
	import com.google.maps.LatLng;
	import com.google.maps.overlays.Marker;
	import com.google.maps.overlays.MarkerOptions;

	/**
	 * @author kelvinluck
	 */
	public class ExampleSingleMarker extends Marker 
	{

		public function ExampleSingleMarker(location:LatLng)
		{
			var options:MarkerOptions = new MarkerOptions();
			options.hasShadow = false;
			options.draggable = false;
			options.icon = new ExampleSingleMarkerIcon();
			super(location, options);
		}
	}
}

import flash.display.Sprite;
internal class ExampleSingleMarkerIcon extends Sprite
{

	public function ExampleSingleMarkerIcon()
	{
		graphics.beginFill(0xff0000);
		graphics.drawCircle(0, 0, 6);
	}
}
