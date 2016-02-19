package Model
{
	[RemoteClass(alias="Album")]
	[Bindable]
	public class Album
	{
		public var albCodigo:int = 0;
		public var albNome:String = "";
		public var artCodigo:int = 0;
		public var artNome:String = "";
		public function Album()
		{
		}
	}
}