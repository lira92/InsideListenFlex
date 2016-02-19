package Model
{
	import flash.external.ExternalInterface;
	
	import mx.controls.Alert;

	public class Funcoes
	{
		public function Funcoes()
		{
		}
		
		public static function URLServer():String{
			var str:String ="";
			if(ExternalInterface.available)
			{
				str = ExternalInterface.call("window.location.href.toString");
				if(str.indexOf("C:/") > -1 || str.indexOf("D:/") > -1)
				{
					str = "http://localhost:5494/InsideListen";
				}
			}
			else
			{	
				Alert.show("Erro de javascript");
			}
			
			if(str.toUpperCase().indexOf("INDEX.HTML") > -1)
			{
				str = str.toUpperCase().replace("INDEX.HTML","");	
			}
			//var str:String = ExternalInterface.call('window.location.href.toString');
			return str;
		}
	}
}