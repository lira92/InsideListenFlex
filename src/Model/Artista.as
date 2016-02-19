package Model
{
	[Bindable]
	[RemoteClass(alias="Artista")]
	public class Artista
	{
		public var artCodigo:int = 0;
		public var artNome:String = "";
		public function Artista()
		{
		}
	}
}