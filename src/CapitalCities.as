package  
{
	import flash.net.URLRequest;
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.display.Sprite;

	/**
	 * Simple class to convert the capital city data from http://home.scarlet.be/sharmadillo/cities.htm
	 * into XML for use in my example
	 * 
	 * @author Kelvin Luck
	 */
	public class CapitalCities extends Sprite 
	{

		public function CapitalCities()
		{
			var loader:URLLoader = new URLLoader();
			loader.addEventListener(Event.COMPLETE, onDataLoaded);
			loader.load(new URLRequest('capitals.csv'));
		}
		
		private function onDataLoaded(event:Event):void
		{
			var out:String = '<capitals>';
			var data:String = (event.target as URLLoader).data;
			var lines:Array = data.split('\n');
			for each (var line:String in lines) {
				var cols:Array = line.split(',');
				if (cols.length < 4) continue;
				var name:String = cols[1].split('"').join('');
				var country:String = cols[0].split('"').join('');
				var latStr:String = cols[2].split('"').join('');
				var lat:Number = Number(latStr.substr(0, -1)) * (latStr.substr(-1) == 'S' ? -1 : 1);
				var lngStr:String = cols[3].split('"').join('');
				var lng:Number = Number(lngStr.substr(0, -1)) * (lngStr.substr(-1) == 'W' ? -1 : 1);
				// String concatination is way quicker than XML creation...
				out += '<capital name="' + name + '" country="' + country + '" lat="' + lat + '" lng="' + lng + '" />';
			}
			out += '</capitals>';
			//trace (out);
			var x:XML = new XML(out);
			trace (x.toXMLString());
		}
	}
}
