package  
{
	import com.google.maps.LatLng;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import com.google.maps.controls.ZoomControl;
	import com.google.maps.Map;
	import com.google.maps.MapEvent;
	import com.google.maps.MapZoomEvent;

	import flash.display.Sprite;
	import flash.geom.Point;

	/**
	 * An example demonstrating how to use my GoogleMapsFlashClusterer which allows
	 * you to cluster points on a map based on their distance from each other.
	 * 
	 * @author Kelvin Luck
	 */
	public class ClusterExample extends Sprite 
	{
		
		private var map:Map;

		public function ClusterExample()
		{
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			
			initMap();
		}
		
		private function initMap():void
		{
			map = new Map();
			map.key = 'ABQIAAAA2XCui2FzpSGWKrct5KK6RhRcXjnLaBx2ctMiRTh7Mhofu8jzCBQJQ8S8l6RXUyxznpv5HYxfT89CLg';
			map.addEventListener(MapEvent.MAP_READY, onMapReady);
			map.setSize(new Point(800, 600));
			addChild(map);
		}

		private function onMapReady(event:MapEvent):void
		{
			map.addControl(new ZoomControl());
			map.setCenter(new LatLng(51.32, 0), 5);
		}
	}
}
