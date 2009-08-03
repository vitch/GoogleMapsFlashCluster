package com.kelvinluck.gmaps 
{
	import com.google.maps.overlays.Marker;

	import flash.geom.Point;
	import flash.utils.Dictionary;

	/**
	 * Distance based clustering solution for google maps markers.
	 * 
	 * <p>Algorithm based on Mika Tuupola's "Introduction to Marker 
	 * Clustering With Google Maps" adapted for use in a dynamic
	 * flash map.</p>
	 * 
	 * @author Kelvin Luck
	 * @see http://www.appelsiini.net/2008/11/introduction-to-marker-clustering-with-google-maps
	 */
	public class Clusterer 
	{
		
		public static const DEFAULT_CLUSTER_RADIUS:int = 25;

		private var _clusters:Array;
		public function get clusters():Array
		{
			if (_invalidated) {
				_clusters = calculateClusters();
				_invalidated = false;
			}
			return _clusters;
		}

		private var _markers:Array;
		public function set markers(value:Array):void
		{
			if (value != _markers) {
				_markers = value;
				_positionedMarkers = [];
				for each (var marker:Marker in value) {
					_positionedMarkers.push(new PositionedMarker(marker));
				}
				_invalidated = true;
			}
		}

		private var _zoom:int;
		public function set zoom(value:int):void
		{
			if (value != _zoom) {
				_zoom = value;
				_invalidated = true;
			}
		}

		private var _clusterRadius:int;
		public function set clusterRadius(value:int):void
		{
			if (value != _clusterRadius) {
				_clusterRadius = value;
				_invalidated = true;
			}
		}

		private var _invalidated:Boolean;
		private var _positionedMarkers:Array;

		public function Clusterer(markers:Array, zoom:int, clusterRadius:int = DEFAULT_CLUSTER_RADIUS)
		{
			this.markers = markers;
			_zoom = zoom;
			_clusterRadius = clusterRadius;
			_invalidated = true;
		}

		private function calculateClusters():Array
		{
			var positionedMarkers:Dictionary = new Dictionary();
			var positionedMarker:PositionedMarker;
			for each (positionedMarker in _positionedMarkers) {
				positionedMarkers[positionedMarker.id] = positionedMarker;
			}
			
			// Rather than taking a sqaure root and dividing by a power of 2 to calculate every distance we
			// do the calculation once here (backwards).
			var compareDistance:Number = Math.pow(_clusterRadius * Math.pow(2, 21 - _zoom), 2);
			
			var clusters:Array = [];
			var cluster:Array;
			var p1:Point;
			var p2:Point;
			var x:int;
			var y:int;
			var compareMarker:PositionedMarker;
			for each (positionedMarker in positionedMarkers) {
				if (positionedMarker == null) {
					continue;
				}
				positionedMarkers[positionedMarker.id] = null;
				cluster = [positionedMarker.marker];
				for each (compareMarker in positionedMarkers) {
					if (compareMarker == null) {
						continue;
					}
					p1 = positionedMarker.point;
					p2 = compareMarker.point;
					x = p1.x - p2.x;
					y = p1.y - p2.y;
					if (x * x + y * y < compareDistance) {
						cluster.push(compareMarker.marker);
						positionedMarkers[compareMarker.id] = null;
					}
				}
				clusters.push(cluster);
			}
			return clusters;
		}
	}
}

import com.google.maps.LatLng;
import com.google.maps.overlays.Marker;

import flash.geom.Point;

internal class PositionedMarker
{

	public static const OFFSET:int = 268435456;
	public static const RADIUS:Number = OFFSET / Math.PI;
	
	// public properties are quicker than getters - speed is important here...
	public var position:LatLng;
	public var point:Point;

	private var _marker:Marker;
	public function get marker():Marker
	{
		return _marker;
	}

	private var _id:int;
	public function get id():int
	{
		return _id;
	}

	private static var globalId:int = 0;

	public function PositionedMarker(marker:Marker)
	{
		_marker = marker;
		_id = globalId++;
		position = marker.getLatLng();
		
		var o:int = OFFSET;
		var r:Number = RADIUS;
		var d:Number = Math.PI / 180;
		var x:int = Math.round(o + r * position.lng() * d);
		var lat:Number = position.lat();
		var y:int = Math.round(o - r * Math.log((1 + Math.sin(lat * d)) / (1 - Math.sin(lat * d))) / 2);
		point = new Point(x, y);
	}
}
