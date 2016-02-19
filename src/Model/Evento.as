package Model
{
	[RemoteClass(alias="Evento")]
	[Bindable]
	public class Evento
	{
		public var eveCodigo:int = 0;
		public var eveTipo:String = "";
		public var eveDescricao:String = "";
		public var eveReferencia:int = 0;
		public var eveDataHora:Date;
		public var usuCodigo:int = 0;
		
		public var usuNome:String = "";
		public var nomeReferencia:String = "";
		public var usuFoto:String = "";
		
		
		public function Evento()
		{
		}
	}
}