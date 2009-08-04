package  
{
	import com.kelvinluck.gmaps.example.ExampleClusterMarker;
	import com.kelvinluck.gmaps.Clusterer;
	import com.google.maps.overlays.Marker;
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
		
		public static const NUM_RANDOM_MARKERS:int = 500;
		
		private var map:Map;
		private var clusterer:Clusterer;
		private var markers:Array;
		private var attachedMarkers:Array;

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
			map.setCenter(new LatLng(51.32, 0), 3);
			map.enableScrollWheelZoom();
			map.addEventListener(MapZoomEvent.ZOOM_CHANGED, onMapZoomChanged);
			addMarkers();
			clusterer = new Clusterer(markers, map.getZoom(), 30);
			attachedMarkers = [];
			attachMarkers();
		}
		
		private function addMarkers():void
		{
			markers = [];
			var i:int = NUM_RANDOM_MARKERS;
			while (i--) {
				markers.push(new Marker(new LatLng(Math.random() * 160 - 80, Math.random() * 360 - 180)));
			}
		}

		private function onMapZoomChanged(event:MapZoomEvent):void
		{
			clusterer.zoom = map.getZoom();
			attachMarkers();
		}
		
		private function attachMarkers():void
		{
			for each (var marker:Marker in attachedMarkers) {
				map.removeOverlay(marker);
			}
			attachedMarkers = [];
			var clusteredMarkers:Array = clusterer.clusters;
			
			for each (var cluster:Array in clusteredMarkers) {
				if (cluster.length == 1) {
					// there is only a single marker in this cluster
					marker = cluster[0];
				} else {
					marker = new ExampleClusterMarker(cluster);
				}
				map.addOverlay(marker);
				attachedMarkers.push(marker);
			}
		}
	}
}
