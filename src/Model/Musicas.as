package Model
{
	[RemoteClass(alias="Musica")]
	[Bindable]
	public class Musicas
	{
		public var musCodigo:int = 0;
		public var musNome:String = "";
		public var genCodigo:int = 0;
		public var albCodigo:int = 0;
		
		public var genNome:String = "";
		public var albNome:String = "";
		public var artNome:String = "";
		
		public function Musicas()
		{
		}
	}
}