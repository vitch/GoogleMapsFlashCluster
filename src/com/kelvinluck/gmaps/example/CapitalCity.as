package com.kelvinluck.gmaps.example 
{

	import com.google.maps.LatLng;
	/**
	 * Quick example class to get a list of all the worlds capital cities.
	 * 
	 * @author Kelvin Luck
	 */
	public class CapitalCity 
	{
		public var name:String;
		public var country:String;
		public var location:LatLng;
		
		public static function getCapitals():Array
		{
			// Data from http://home.scarlet.be/sharmadillo/cities.htm  - see capital_cities branch for conversion code
			var capitalXML:XML = <capitals>
  <capital name="Kabul" country="Afghanistan" lat="34.31" lng="69.12"/>
  <capital name="Tirana" country="Albania" lat="41.2" lng="19.49"/>
  <capital name="Algiers" country="Algeria" lat="36.5" lng="3"/>
  <capital name="Pago Pago" country="American Samoa" lat="-14.16" lng="-170.43"/>
  <capital name="Andorra la Vella" country="Andorra" lat="42.3" lng="1.3"/>
  <capital name="Luanda" country="Angola" lat="-8.5" lng="13.15"/>
  <capital name="St John's" country="Antigua and Barbuda" lat="17.08" lng="-61.5"/>
  <capital name="Buenos Aires" country="Argentina" lat="34.4" lng="-58.3"/>
  <capital name="Yerevan" country="Armenia" lat="40.1" lng="44.31"/>
  <capital name="Oranjestad" country="Aruba" lat="12.32" lng="-70.02"/>
  <capital name="Canberra" country="Australia" lat="-35.18" lng="149.08"/>
  <capital name="Vienna" country="Austria" lat="48.13" lng="16.22"/>
  <capital name="Baku" country="Azerbaijan" lat="40.22" lng="49.53"/>
  <capital name="Nassau" country="Bahamas" lat="25.05" lng="-77.2"/>
  <capital name="Manama" country="Bahrain" lat="26.12" lng="50.38"/>
  <capital name="Dhaka" country="Bangladesh" lat="23.42" lng="90.22"/>
  <capital name="Bridgetown" country="Barbados" lat="13.06" lng="-59.37"/>
  <capital name="Brussels" country="Belgium" lat="50.5" lng="4.21"/>
  <capital name="Belmopan" country="Belize" lat="17.13" lng="-88.48"/>
  <capital name="Porto Novo" country="Benin" lat="6.3" lng="2.47"/>
  <capital name="Hamilton" country="Bermuda" lat="32.18" lng="-64.48"/>
  <capital name="Thimphu" country="Bhutan" lat="27.32" lng="89.43"/>
  <capital name="La Paz" country="Bolivia" lat="-16.3" lng="-68.1"/>
  <capital name="Sarajevo" country="Bosnia-Herzegovina" lat="43.52" lng="18.26"/>
  <capital name="Gaborone" country="Botswana" lat="-24.45" lng="25.55"/>
  <capital name="Brasília" country="Brazil" lat="-15.45" lng="-47.57"/>
  <capital name="Road Town" country="British Virgin Islands" lat="18.28" lng="-64.39"/>
  <capital name="Bandar Seri Begawan" country="Brunei" lat="4.56" lng="114.58"/>
  <capital name="Sofia" country="Bulgaria" lat="42.4" lng="23.18"/>
  <capital name="Ouagadougou" country="Burkina Faso" lat="12.22" lng="-1.31"/>
  <capital name="Bujumbura" country="Burundi" lat="-3.22" lng="29.19"/>
  <capital name="Minsk" country="Byelarus" lat="53.51" lng="27.3"/>
  <capital name="Phnom Penh" country="Cambodia" lat="11.35" lng="104.55"/>
  <capital name="Yaounde" country="Cameroon" lat="3.52" lng="11.31"/>
  <capital name="Ottawa" country="Canada" lat="45.25" lng="-75.43"/>
  <capital name="Cidade de Praia" country="Cape Verde" lat="39.03" lng="-27.59"/>
  <capital name="Bangui" country="Central African Republic" lat="4.23" lng="18.37"/>
  <capital name="N'djaména" country="Chad" lat="12.1" lng="14.59"/>
  <capital name="Santiago" country="Chile" lat="-50.46" lng="-75.26"/>
  <capital name="Beijing" country="China" lat="39.55" lng="116.26"/>
  <capital name="Bogotá" country="Colombia" lat="4.38" lng="-74.05"/>
  <capital name="Moroni" country="Comoros" lat="-11.4" lng="43.16"/>
  <capital name="Brazzaville" country="Congo" lat="-4.14" lng="15.14"/>
  <capital name="Avarua" country="Cook Islands" lat="-21.12" lng="-159.46"/>
  <capital name="San José" country="Costa Rica" lat="9.59" lng="-84.04"/>
  <capital name="Yamoussoukro" country="Côte D'ivoire" lat="6.49" lng="-5.17"/>
  <capital name="Zagreb" country="Croatia" lat="45.48" lng="15.58"/>
  <capital name="Havana" country="Cuba" lat="23.07" lng="-82.25"/>
  <capital name="Nicosia" country="Cyprus" lat="35.09" lng="33.21"/>
  <capital name="Prague" country="Czech Republic" lat="50.06" lng="14.26"/>
  <capital name="Copenhagen" country="Denmark" lat="55.43" lng="12.34"/>
  <capital name="Djibouti" country="Djibouti" lat="11.3" lng="4.06"/>
  <capital name="Roseau" country="Dominica" lat="15.18" lng="-61.23"/>
  <capital name="Santo Domingo" country="Dominican Republic" lat="18.3" lng="-69.57"/>
  <capital name="Quito" country="Ecuador" lat="-0.14" lng="-78.3"/>
  <capital name="Cairo" country="Egtpt" lat="30.03" lng="31.15"/>
  <capital name="San Salvador" country="El Salvador" lat="13.4" lng="-89.1"/>
  <capital name="Malabo" country="Equatorial Guinea" lat="3.45" lng="8.48"/>
  <capital name="Asmera" country="Eritrea" lat="15.2" lng="38.58"/>
  <capital name="Tallinn" country="Estonia" lat="59.22" lng="24.48"/>
  <capital name="Addis Ababa" country="Ethiopia" lat="9.03" lng="38.42"/>
  <capital name="Suva" country="Fiji" lat="-18.08" lng="178.25"/>
  <capital name="Helsinki" country="Finland" lat="60.08" lng="25"/>
  <capital name="Paris" country="France" lat="48.5" lng="2.2"/>
  <capital name="Cayenne" country="French Guiana" lat="4.55" lng="-52.18"/>
  <capital name="Papeete" country="French Polynesia" lat="-17.32" lng="-149.34"/>
  <capital name="Libreville" country="Gabon" lat="0.3" lng="9.25"/>
  <capital name="Banjul" country="Gambia" lat="13.28" lng="-16.39"/>
  <capital name="Tbilisi" country="Georgia" lat="41.43" lng="44.48"/>
  <capital name="Berlin" country="Germany" lat="52.32" lng="13.25"/>
  <capital name="Accra" country="Ghana" lat="5.33" lng="-0.15"/>
  <capital name="Athens" country="Greece" lat="38" lng="23.44"/>
  <capital name="Godthåb" country="Greenland" lat="64.15" lng="-51.35"/>
  <capital name="St George's" country="Grenada" lat="12.04" lng="-61.44"/>
  <capital name="Basse-Terre" country="Guadeloupe" lat="16" lng="-61.43"/>
  <capital name="Agaña" country="Guam" lat="13.28" lng="144.45"/>
  <capital name="Guatemala City" country="Guatemala" lat="14.38" lng="-90.22"/>
  <capital name="Conakry" country="Guinea" lat="9.31" lng="-13.43"/>
  <capital name="Bissau" country="Guinea-Bissau" lat="11.52" lng="-15.39"/>
  <capital name="Georgetown" country="Guyana" lat="6.46" lng="-58.1"/>
  <capital name="Port-au-Prince" country="Haiti" lat="18.32" lng="-72.2"/>
  <capital name="Tegucigalpa" country="Honduras" lat="14.05" lng="-87.14"/>
  <capital name="Victoria" country="Hong Kong" lat="22.16" lng="114.13"/>
  <capital name="Budapest" country="Hungary" lat="47.3" lng="19.03"/>
  <capital name="Reykjavík" country="Iceland" lat="6.09" lng="-21.51"/>
  <capital name="New Delhi" country="India" lat="28.37" lng="77.13"/>
  <capital name="Jakarta" country="Indonesia" lat="-6.08" lng="106.45"/>
  <capital name="Tehran" country="Iran" lat="35.4" lng="51.26"/>
  <capital name="Baghdad" country="Iraq" lat="33.2" lng="44.26"/>
  <capital name="Dublin" country="Ireland" lat="53.2" lng="-6.15"/>
  <capital name="Jerusalem" country="Israel" lat="31.47" lng="35.13"/>
  <capital name="Rome" country="Italy" lat="41.48" lng="12.36"/>
  <capital name="Kingston" country="Jamaica" lat="17.58" lng="-76.48"/>
  <capital name="Tokyo" country="Japan" lat="35.4" lng="139.45"/>
  <capital name="Amman" country="Jordan" lat="31.57" lng="35.56"/>
  <capital name="Alma-Ata" country="Kazakhstan" lat="43.19" lng="76.55"/>
  <capital name="Nairobi" country="Kenya" lat="-1.17" lng="36.49"/>
  <capital name="Tarawa" country="Kiribati" lat="1.3" lng="173"/>
  <capital name="Pyongyang" country="Korea North" lat="39" lng="125.47"/>
  <capital name="Seoul" country="Korea South" lat="37.3" lng="12"/>
  <capital name="Kuwait" country="Kuwait" lat="29.2" lng="48"/>
  <capital name="Bishkek" country="Kyrgyzstan" lat="40.07" lng="71.44"/>
  <capital name="Vientiane" country="Laos" lat="17.59" lng="102.38"/>
  <capital name="Riga" country="Latvia" lat="56.4" lng="106.1"/>
  <capital name="Beirut" country="Lebanon" lat="33.52" lng="35.3"/>
  <capital name="Maseru" country="Lesotho" lat="-29.19" lng="27.29"/>
  <capital name="Monrovia" country="Liberia" lat="6.18" lng="-10.47"/>
  <capital name="Tripoli" country="Libya" lat="32.54" lng="13.11"/>
  <capital name="Vaduz" country="Liechtenstein" lat="47.08" lng="9.32"/>
  <capital name="Vilnius" country="Lithuania" lat="54.4" lng="25.19"/>
  <capital name="Luxembourg" country="Luxembourg" lat="49.37" lng="6.08"/>
  <capital name="Macau City" country="Macau" lat="0" lng="0"/>
  <capital name="Skopje" country="Macedonia" lat="42" lng="21.28"/>
  <capital name="Antananarivo" country="Madagascar" lat="-18.52" lng="47.3"/>
  <capital name="Lilongwe" country="Malawi" lat="-13.58" lng="33.49"/>
  <capital name="Kuala Lumpur" country="Malaysia" lat="3.08" lng="101.42"/>
  <capital name="Malé" country="Maldives" lat="4" lng="73.28"/>
  <capital name="Bamako" country="Mall" lat="12.4" lng="-7.59"/>
  <capital name="Valletta" country="Malta" lat="35.54" lng="14.32"/>
  <capital name="Majuro" country="Marshall Islands" lat="7.05" lng="171.08"/>
  <capital name="Fort-de-France" country="Martinique" lat="14.36" lng="-61.05"/>
  <capital name="Nouakchott" country="Mauritania" lat="1.09" lng="-15.58"/>
  <capital name="Port Louis" country="Mauritius" lat="-20.1" lng="57.3"/>
  <capital name="Dzaoudzi" country="Mayotte" lat="-12.48" lng="45.18"/>
  <capital name="Mexico City" country="Mexico" lat="19.25" lng="-99.1"/>
  <capital name="Kolonia" country="Micronesia (Federated States of)" lat="0" lng="0"/>
  <capital name="Kishinev" country="Moldova" lat="47" lng="28.5"/>
  <capital name="Monaco" country="Monaco" lat="43.44" lng="7.25"/>
  <capital name="Ulan Bator" country="Mongolia" lat="47.54" lng="106.52"/>
  <capital name="Plymouth" country="Montserrat" lat="16.44" lng="-62.14"/>
  <capital name="Rabat" country="Morocco" lat="34.02" lng="-16.51"/>
  <capital name="Maputo" country="Mozambique" lat="25.58" lng="32.35"/>
  <capital name="Yangon" country="Myanmar" lat="16.47" lng="96.1"/>
  <capital name="Windhoek" country="Namibia" lat="-22.34" lng="17.06"/>
  <capital name="No offical capital" country="Nauru" lat="0" lng="0"/>
  <capital name="Katmandu" country="Nepal" lat="27.42" lng="85.19"/>
  <capital name="Amsterdam" country="Netherlands" lat="52.21" lng="4.54"/>
  <capital name="Willemstad" country="Netherlands Antilles" lat="12.12" lng="-68.56"/>
  <capital name="Nouméa" country="New Caledonia" lat="-22.16" lng="166.26"/>
  <capital name="Wellington" country="New Zealand" lat="-41.17" lng="174.47"/>
  <capital name="Managua" country="Nicaragua" lat="12.06" lng="-86.18"/>
  <capital name="Niamey" country="Niger" lat="13.32" lng="2.05"/>
  <capital name="Lagos" country="Nigeria" lat="6.27" lng="3.28"/>
  <capital name="Alofi" country="Niue" lat="-14.27" lng="-178.05"/>
  <capital name="Oslo" country="Norway" lat="59.55" lng="10.45"/>
  <capital name="Muscat" country="Oman" lat="23.37" lng="58.38"/>
  <capital name="Islamabad" country="Pakistan" lat="33.4" lng="73.08"/>
  <capital name="Koror" country="Palau" lat="7.21" lng="134.31"/>
  <capital name="Panama City" country="Panama" lat="8.58" lng="-79.32"/>
  <capital name="Port Moresby" country="Papua New Guinea" lat="-9.3" lng="14.07"/>
  <capital name="Asunción" country="Paraguay" lat="-25.15" lng="-57.4"/>
  <capital name="Lima" country="Peru" lat="-12.06" lng="-77.03"/>
  <capital name="Manila" country="Philippines" lat="14.37" lng="120.58"/>
  <capital name="Warsaw" country="Poland" lat="52.15" lng="21"/>
  <capital name="Lisbon" country="Portugal" lat="38.44" lng="-9.08"/>
  <capital name="San Juan" country="Puerto Rico" lat="18.28" lng="-6.07"/>
  <capital name="Doha" country="Qatar" lat="25.15" lng="51.36"/>
  <capital name="Saint-Denis" country="Réunion" lat="-20.52" lng="55.27"/>
  <capital name="Bucharest" country="Romania" lat="44.25" lng="26.07"/>
  <capital name="Moscow" country="Russian Federation" lat="55.45" lng="37.42"/>
  <capital name="Kigali" country="Rwanda" lat="-1.56" lng="30.04"/>
  <capital name="San Marino" country="San Marino" lat="43.56" lng="12.26"/>
  <capital name="São Tomé" country="São Tomé and Principe" lat="0.19" lng="6.43"/>
  <capital name="Riyadh" country="Saudi Arabia" lat="24.39" lng="46.46"/>
  <capital name="Dakar" country="Senegal" lat="14.38" lng="-17.27"/>
  <capital name="Victoria" country="Seychelles" lat="-4.38" lng="55.28"/>
  <capital name="Freetown" country="Sierra Leone" lat="8.3" lng="-13.17"/>
  <capital name="Singapore" country="Singapore" lat="1.18" lng="103.5"/>
  <capital name="Bratislava" country="Slovakia" lat="48.1" lng="17.1"/>
  <capital name="Ljubljana" country="Slovenia" lat="46.04" lng="14.3"/>
  <capital name="Honiara" country="Solomon Islands" lat="-9.28" lng="159.57"/>
  <capital name="Mogadishu" country="Somalia" lat="2.02" lng="45.21"/>
  <capital name="Pretoria" country="South Africa" lat="-25.45" lng="28.12"/>
  <capital name="Madrid" country="Spain" lat="40.25" lng="-3.43"/>
  <capital name="Colombo" country="Sri Lanka" lat="6.55" lng="79.52"/>
  <capital name="Basseterre" country="St Christopher and Nevis" lat="16" lng="-61.43"/>
  <capital name="Castries" country="St Lucia" lat="14.01" lng="-60.59"/>
  <capital name="Kingstown" country="St Vincent and the Grenadines" lat="13.12" lng="-61.14"/>
  <capital name="Khartoum" country="Sudan" lat="15.33" lng="32.32"/>
  <capital name="Paramaribo" country="Surinam" lat="5.52" lng="-55.14"/>
  <capital name="Mbabane" country="Swaziland" lat="-26.2" lng="31.08"/>
  <capital name="Stockholm" country="Sweden" lat="59.2" lng="1.03"/>
  <capital name="Bern" country="Switzerland" lat="46.57" lng="7.26"/>
  <capital name="Damascus" country="Syria" lat="33.3" lng="36.19"/>
  <capital name="Taipei" country="Taiwan" lat="25.5" lng="121.32"/>
  <capital name="Dushanbe" country="Tajikistan" lat="38.38" lng="68.51"/>
  <capital name="Dodoma" country="Tanzania" lat="-6.1" lng="35.4"/>
  <capital name="Bangkok" country="Thailand" lat="13.44" lng="100.3"/>
  <capital name="Lomé" country="Togo" lat="6.1" lng="1.21"/>
  <capital name="Nuku'alofa" country="Tonga" lat="-21.09" lng="-175.14"/>
  <capital name="Port-of-Spain" country="Trinidad and Tobago" lat="10.38" lng="-61.31"/>
  <capital name="Tunis" country="Tunisia" lat="36.48" lng="10.11"/>
  <capital name="Ankara" country="Turkey" lat="39.55" lng="32.5"/>
  <capital name="Ashkhabad" country="Turkmenistan" lat="37.58" lng="58.24"/>
  <capital name="Cockburn Harbour" country="Turks and Caicos Islands" lat="21.3" lng="-71.3"/>
  <capital name="Fongafale" country="Tuvalu" lat="-8.3" lng="179.12"/>
  <capital name="Kampala" country="Uganda" lat="0.19" lng="32.35"/>
  <capital name="Kiev" country="Ukraine" lat="50.25" lng="30.3"/>
  <capital name="Abu Dhabi" country="United Arab Emirates" lat="24.28" lng="54.25"/>
  <capital name="London" country="United Kingdom" lat="51.3" lng="-0.1"/>
  <capital name="Washington" country="United States of America" lat="38.55" lng="-77"/>
  <capital name="Montevideo" country="Uruguay" lat="-34.53" lng="-56.11"/>
  <capital name="Charlotte Amalie" country="US Virgin Islands" lat="18.22" lng="-64.56"/>
  <capital name="Tashkent" country="Uzbekistan" lat="41.16" lng="69.13"/>
  <capital name="Port Vila" country="Vanuatu" lat="-17.45" lng="168.18"/>
  <capital name="Vatican City" country="Vatican City" lat="41.54" lng="12.27"/>
  <capital name="Caracas" country="Venezuela" lat="10.35" lng="-66.56"/>
  <capital name="Hanoi" country="Vietnam" lat="21.01" lng="105.52"/>
  <capital name="Laàyoune" country="Western Sahara" lat="27.1" lng="-13.11"/>
  <capital name="Apia" country="Western Samoa" lat="-13.48" lng="-171.45"/>
  <capital name="San'a" country="Yemen" lat="15.24" lng="44.14"/>
  <capital name="Belgrade" country="Yugoslavia" lat="44.5" lng="20.3"/>
  <capital name="Kinshasa" country="Zaire" lat="-4.18" lng="15.18"/>
  <capital name="Lusaka" country="Zambia" lat="-15.26" lng="28.2"/>
  <capital name="Harare" country="Zimbabwe" lat="-17.5" lng="31.03"/>
</capitals>;
			var capitals:Array = [];
			var capital:CapitalCity;
			for each (var capitalNode:XML in capitalXML.capital) {
				capital = new CapitalCity();
				capital.name = capitalNode.@name;
				capital.country = capitalNode.@country;
				capital.location = new LatLng(capitalNode.@lat, capitalNode.@lng);
				capitals.push(capital);
			}
			return capitals;
		}
	}
}
