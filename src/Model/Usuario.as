package Model
{
	[RemoteClass(alias="Usuario")]
	[Bindable]
	public class Usuario
	{
		public var usuCodigo:int = 0;
		public var usuNome:String = "";
		public var usuFoto:String = "";
		public var usuEmail:String = "";
		public var usuAdmin:Boolean = true;
		public var usuSenha:String = "";
		public var usuConfirma:String = "";
		
		public function Usuario()
		{
		}
	}
}