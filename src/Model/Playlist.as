package Model
{
	[RemoteClass(alias="Playlist")]
	[Bindable]
	public class Playlist
	{
		public var plaCodigo:int = 0;
		public var plaNome:String = "";
		public var genCodigo:int = 0;
		public var usuCodigo:int = 0;
		
		public var usuNome:String = "";
		public var genNome:String = "";
		
		public function Playlist()
		{
		}
	}
}