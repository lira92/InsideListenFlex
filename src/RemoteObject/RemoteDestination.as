package RemoteObject { 
	//import components.ServiceAlert;
	
	import mx.controls.Alert;
	import mx.rpc.events.FaultEvent;

	/** 
	 * Classe de constantes para declarações de RemoteDestination, 
	 * onde contém as informações de source e id do destination em questão. 
	 **/
	public class RemoteDestination{ 
		private var destination:String = new String(); 
		private var source:String = new String(); 
		/** 
		 * Nome de destination para operações com Usuário. 
		 **/
		public function RemoteDestination(name:String, source:String):void{ 
			
			this.destination = name; 
			this.source = source; 
		} 
		/** 
		 * Retorna o id do serviço remoto. 
		 **/
		public function getDestination():String{ 
			return destination; 
		} 
		/** 
		 * Retorna o source do serviço remoto. 
		 **/
		public function getSource():String{ 
			return this.source; 
		} 
		
		/** 
		 * Invoca uma requisição remota. 
		 * @param nome do source(Classe). 
		 * @param definição do token para cada chamada do método. Nulo por padrão. 
		 * @param metodo a ser executada no lado servidor. 
		 * @param successFunction Função a ser executada caso a operação remota ocorra com sucesso. 
		 * @param args Argumentos passados a operação remota. 
		 * @param Exemplo de chamada:
		 * 
		 * RemoteDestination.Remote("Grupos",
					* "listaGrupo",
					* "listaGrupos",
					* minhaFuncaoDeErro,
					* minhaFuncaoDeSucessoLista,
					* "CodGrupo=2",
					* "Ativo=1"
				);
		 **/
		public static function Remote2(source:String, tok:Object, metodo:String, funcaoSucesso:Function,...args):void{			
			var someArgs:Array = new Array();
			for(var i:uint=0 ; i < args.length ; i++){
				someArgs.push(args[i]);
			}
			var destination:RemoteDestination = new RemoteDestination("fluorine",source);
			var remoteObject:RemoteCall = new RemoteCall(destination); 
			remoteObject.invoke(tok,metodo, function(e:FaultEvent):void { Alert.show(e.fault.toString()) } ,funcaoSucesso, someArgs);
		}
		
		/** 
		 * Invoca uma requisição remota. 
		 * @param nome do source(Classe). 
		 * @param definição do token para cada chamada do método. Nulo por padrão. 
		 * @param metodo a ser executada no lado servidor. 
		 * @param successFunction Função a ser executada caso a operação remota ocorra com sucesso. 
		 * @param args Argumentos passados a operação remota. 
		 * @param Exemplo de chamada:
		 * 
		 * RemoteDestination.Remote("Grupos",
		 * "listaGrupo",
		 * "listaGrupos",
		 * minhaFuncaoDeErro,
		 * minhaFuncaoDeSucessoLista,
		 * "CodGrupo=2",
		 * "Ativo=1"
		 );
		 **/
		public static function Remote(source:String, tok:Object, metodo:String, funcaoFault:Function, funcaoSucesso:Function,...args):void{			
			var someArgs:Array = new Array();
			for(var i:uint=0 ; i < args.length ; i++){
				someArgs.push(args[i]);
			}
			var destination:RemoteDestination = new RemoteDestination("fluorine",source);
			var remoteObject:RemoteCall = new RemoteCall(destination); 
			remoteObject.invoke(tok,metodo, funcaoFault ,funcaoSucesso, someArgs);
		}
	}
}
