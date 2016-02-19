package RemoteObject { 
	import Model.Funcoes;
	
	import flash.external.ExternalInterface;
	
	import mx.controls.Alert;
	import mx.core.Application;
	import mx.core.FlexGlobals;
	import mx.managers.CursorManager;
	import mx.messaging.ChannelSet;
	import mx.messaging.channels.AMFChannel;
	import mx.rpc.AbstractOperation;
	import mx.rpc.AsyncToken;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.remoting.mxml.RemoteObject;
	
	
	/** 
	 * Classe de requisições remotas usando RemoteObject. 
	 **/
	public class RemoteCall{ 
		/** 
		 * Indica se o channelSet está construido. 
		 */
		private var channelBuilded:Boolean = false; 
		/** 
		 * ChannelSet do RemoteObject 
		 **/
		private var channelSet : ChannelSet = new ChannelSet(); 
		/** 
		 * RemoteDestination 
		 **/
		private var destination:RemoteDestination = null; 
		/** 
		 * Função chamada quando tudo ocorrer corretamente. 
		 */
		private var functionSuccess:Function = null; 
		/** 
		 * Função chamada quando algo de errado ocorrer 
		 */
		private var functionError:Function = null; 
		/** 
		 * 
		 * @param destination O Destination do RemoteObject. 
		 **/
		public function RemoteCall(destination:RemoteDestination){ 
			this.destination = destination; 
		} 
		/** 
		 * Cria um ChannelSet. 
		 **/		
		public var amfChannel:AMFChannel;
		private function getChannelSet():void{ 
			var str:String = Funcoes.URLServer()+"/Gateway.aspx";
			amfChannel = new AMFChannel("my-amf",str); 
			channelSet.addChannel(amfChannel); 
			channelBuilded = true; 
		} 
		/** 
		 * Retorna o endereço messagebroker da aplicação. 
		 **/
		private function getMessageBroker():String{ 
			return FlexGlobals.topLevelApplication.application.url.substr(0, FlexGlobals.topLevelApplication.url.indexOf("/cms.swf"))+"/messagebroker/amf"; 
		} 
		/** 
		 * Invoca uma requisição remota. 
		 * @param Token. 
		 * @param operation Operação a ser executada no lado servidor. 
		 * @param faultFunction Função a ser executada caso ocorra um erro. 
		 * @param successFunction Função a ser executada caso a operação remota ocorra com sucesso. 
		 * @param args Argumentos passados a operação remota. 
		 **/
		private var tok:AsyncToken;
		public function invoke(nomeTok:Object, operation:String, faultFunction:Function = null, 
							   successFunction:Function = null, par:Object = null):void{ 
			functionSuccess = successFunction; 
			functionError = faultFunction; 
			// capturando o remoteObject 
			var remoteObject : RemoteObject = getRemoteObject(destination.getDestination()); 
			// setando o source ( pacote + classe ) 
			remoteObject.source = this.destination.getSource(); 
			// adicionando listener para a funcao de retorno 
			remoteObject.addEventListener(ResultEvent.RESULT, onSuccess); 
			//se foi definido uma função de erro. 
			remoteObject.addEventListener(FaultEvent.FAULT, onFault); 
			// se a lista de argumentos for vazia não será passado nada como parametro. 
			// capturando o nome do método do destination a ser invocado. 
			var remoteOperation:mx.rpc.AbstractOperation = remoteObject[operation]; 
			var args:Array = par as Array;
			if(args[0] != null){ 
				// serando os argumentos 
				remoteOperation.arguments = args; 
			} 
			CursorManager.setBusyCursor(); 
			// invocando o servico remoto
		
			tok = remoteOperation.send(); tok.dado = nomeTok; 
		} 
		/** 
		 * Constroe o remoteObject 
		 **/
		private function getRemoteObject(destination:String):RemoteObject{ 
			if(channelBuilded == false) 
				getChannelSet(); 
			var remoteObject:RemoteObject = new RemoteObject(destination); 
			remoteObject.channelSet = channelSet; 
			return remoteObject; 
		} 
		
		
		private function onSuccess(result:ResultEvent):void{ 
			CursorManager.removeBusyCursor(); 
			if(this.functionSuccess != null){ 
				this.functionSuccess.call(this, result); 
			} 
		} 
		
		
		/** 
		 * Manipulador default de mensagens de erro, caso não for 
		 * expecificado será invocada esta função em caso de erro. 
		 **/
		private function onFault(result:FaultEvent):void{ 
			CursorManager.removeBusyCursor(); 
			if(this.functionError != null){ 
				this.functionError.call(this, result); 
			}else{ 
				Alert.show(String(result.message)); 
			} 
		} 
	} 
}