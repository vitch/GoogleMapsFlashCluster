package com.kelvinluck.gmaps {
	import flash.geom.Point;

	/**
	 * Distance based clustering solution for google maps markers.
	 *
	 * <p>Algorithm based on Mika Tuupola's "Introduction to Marker
	 * Clustering With Google Maps" adapted for use in a dynamic
	 * flash map.</p>
	 *
	 * @author Kelvin Luck
	 * @author Christoph Polcin - speedup calculateClusters
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

		public function set markers(value:Array):void
		{
			var i:int = -1,
				l:int = value.length;

			_positionedMarkers = new Vector.<PositionedMarker>(l);
			while(++i<l)
				_positionedMarkers[i] = new PositionedMarker( value[i] );

			_invalidated = true;
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
		private var _positionedMarkers:Vector.<PositionedMarker>;

		public function Clusterer(markers:Array, zoom:int, clusterRadius:int = DEFAULT_CLUSTER_RADIUS)
		{
			this.markers = markers;
			_zoom = zoom;
			_clusterRadius = clusterRadius;
			_invalidated = true;
		}

		private function calculateClusters():Array
		{
			var clusterMArAr : Array = [],
				om : PositionedMarker,
				cm : PositionedMarker,
				// Rather than taking a sqaure root and dividing by a power of 2 to calculate every distance we
				// do the calculation once here (backwards).
				compareDistance : Number = Math.pow(_clusterRadius * Math.pow(2, 21 - _zoom), 2),
				clusterMAr : Array,
				p1 : Point,
				p2 : Point,
				x : int,
				y : int,
				i:int = -1,
				j:int,
				l:int = _positionedMarkers.length,
				doneV : Vector.<int> = new Vector.<int>(l);

				while(++i < l) {
					if(doneV[i])
						continue;

					om = _positionedMarkers[i];

					doneV[i] = 1;
					clusterMAr = [om.marker];
					j = i;
					while(++j < l) {
						if(doneV[j])
							continue;

						cm = _positionedMarkers[j];

						p1 = om.point;
						p2 = cm.point;
						x = p1.x - p2.x;
						y = p1.y - p2.y;
						if (x * x + y * y < compareDistance) {
							clusterMAr.push(cm.marker);
							doneV[j] = 1;
						}
					}
					clusterMArAr.push(clusterMAr);
				}

			return clusterMArAr;
		}
	}
}

import com.google.maps.overlays.Marker;

import flash.geom.Point;

final internal class PositionedMarker
{
	public var point:Point;
	public var marker:Marker;

	public function PositionedMarker(marker:Marker)
	{
		this.marker = marker;

		with(marker.getLatLng()){
			point = new Point(Math.round(268435456 /*off*/ + 85445659.44705395 /* rad = off / pi */ * lng() * 0.017453292519943295) /* long to X */, Math.round(268435456 /*off*/ - 85445659.44705395 /* rad = off / pi */ * Math.log((1 + Math.sin(lat() * 0.017453292519943295)) / (1 - Math.sin(lat() * 0.017453292519943295))) / 2)/* lat to Y */);
		}
	}
}
