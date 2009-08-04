package com.kelvinluck.gmaps.example 
{
	import com.google.maps.overlays.Marker;
	import com.google.maps.overlays.MarkerOptions;

	/**
	 * @author kelvinluck
	 */
	public class ExampleClusterMarker extends Marker 
	{

		public function ExampleClusterMarker(cluster:Array)
		{
			var options:MarkerOptions = new MarkerOptions();
			options.icon = new ExampleClusterMarkerIcon(cluster.length);
			options.hasShadow = false;
			super((cluster[0] as Marker).getLatLng(), options);
		}
	}
}

import flash.display.Sprite;
import flash.text.TextField;
import flash.text.TextFormat;

internal class ExampleClusterMarkerIcon extends Sprite
{

	public function ExampleClusterMarkerIcon(numChildren:int)
	{
		graphics.beginFill(0xff0000);
		graphics.drawCircle(0, 0, 15);
		var tf:TextField = new TextField();
		var format:TextFormat = tf.getTextFormat();
		format.font = 'arial';
		tf.defaultTextFormat = format;
		tf.text = numChildren + '';
		tf.textColor = 0xffffff;
		tf.x = -int(tf.textWidth / 2) - 2;
		tf.y = -int(tf.textHeight / 2);
		tf.mouseEnabled = false;
		tf.width = tf.textWidth + 4;
		mouseChildren = false;
		addChild(tf);
	}
}