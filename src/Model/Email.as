package Model
{
	import RemoteObject.RemoteDestination;

	[Bindable]
	[RemoteClass(alias="Email")]
	public class Email
	{
		public var assunto:String = "";
		public var destinatario:String = "";
		public var mensagem:String = "";
		
		public function Email()
		{
		}
	}
}