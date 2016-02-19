package Model
{
	[RemoteClass(alias="PlaylistMusica")]
	[Bindable]
	public class PlaylistMusica
	{
		public var plaCodigo:int = 0;
		public var musCodigo:int = 0;
		public var musNome:String = "";
		public var genNome:String = "";
		public var artNome:String = "";
		
		public function PlaylistMusica()
		{
		}
	}
}