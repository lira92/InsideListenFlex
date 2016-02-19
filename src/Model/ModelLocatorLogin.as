package Model
{
	[Bindable]
	public class ModelLocatorLogin
	{
		public var usuarioLogado:Usuario = new Usuario();
		
		private static var instance:ModelLocatorLogin;
		
		public function ModelLocatorLogin(enforcer:SingletonEnforcer)
		{
			if(enforcer==null)
			{
				throw new Error("[ ModelLocator Error] : Instância inválida.");
			}
		}
		
		public static function getInstance():ModelLocatorLogin
		{
			return instance=( instance==null ) ?
				new ModelLocatorLogin(new SingletonEnforcer()):instance;
		}
	}
}
class SingletonEnforcer{}