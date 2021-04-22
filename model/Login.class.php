<?php

class Login extends Conexao {
	private $user, $senha;

	function __construct() {
		parent::__construct();
	}

	function GetLogin($user, $senha) {
		$this->setUser($user);
		$this->setSenha($senha);

		$query = "SELECT * FROM {$this->prefix}clientes WHERE cli_email = :email AND cli_pass = :senha";

		$params = array(
			':email' => $this->getUser(),
			':senha' => $this->getSenha(),
		);

		$this->ExecuteSQL($query, $params);

		if ($this->TotalDados() > 0) {
			$lista = $this->ListarDados();

			$_SESSION['CLI']['cli_id'] = $lista['cli_id'];
			$_SESSION['CLI']['cli_nome'] = $lista['cli_nome'];
			$_SESSION['CLI']['cli_sobrenome'] = $lista['cli_sobrenome'];
			$_SESSION['CLI']['cli_endereco'] = $lista['cli_endereco'];
			$_SESSION['CLI']['cli_numero'] = $lista['cli_numero'];
			$_SESSION['CLI']['cli_bairro'] = $lista['cli_bairro'];
			$_SESSION['CLI']['cli_cidade'] = $lista['cli_cidade'];
			$_SESSION['CLI']['cli_uf'] = $lista['cli_uf'];
			$_SESSION['CLI']['cli_cpf'] = $lista['cli_cpf'];
			$_SESSION['CLI']['cli_cep'] = $lista['cli_cep'];
			$_SESSION['CLI']['cli_rg'] = $lista['cli_rg'];
			$_SESSION['CLI']['cli_ddd'] = $lista['cli_ddd'];
			$_SESSION['CLI']['cli_fone'] = $lista['cli_fone'];
			$_SESSION['CLI']['cli_email'] = $lista['cli_email'];
			$_SESSION['CLI']['cli_celular'] = $lista['cli_celular'];
			$_SESSION['CLI']['cli_data_nasc'] = $lista['cli_data_nasc'];
			$_SESSION['CLI']['cli_hora_cad'] = $lista['cli_hora_cad'];
			$_SESSION['CLI']['cli_data_cad'] = $lista['cli_data_cad'];
			$_SESSION['CLI']['cli_pass'] = $lista['cli_pass'];

/*Redirecionando para tela de Cliente Login para mesma pág afim de dar um REFRESH
 */
			Rotas::Redirecionar(0, Rotas::pag_CLienteLogin());

		} else {
			echo '<script> alert("Dados Incorretos"); </script>';
		}

	}

	/*Caso ocorra acesso negado, manda pro cadastro de usuário*/
	static function AcessoNegado() {

		/*Concatenando com a pag_ClienteLogin
		*/
		echo '<div class="alert alert-danger"><a href="' . Rotas::pag_ClienteLogin() . '" class="btn btn-danger">Login </a> Acesso Negado, faça Login</div>';
	}

	function GetLoginADM($user, $senha) {

		$this->setUser($user);
		$this->setSenha($senha);

		$query = "SELECT * FROM {$this->prefix}users WHERE user_email = :email AND user_pw = :senha";

		$params = array(':email' => $this->getUser(),
			':senha' => $this->getSenha());

		$this->ExecuteSQL($query, $params);

		// caso o login seja efetivado com exito

        print_r($this->TotalDados());

		if ($this->TotalDados() > 0):

			$lista = $this->ListarDados();

			$_SESSION['ADM']['user_id'] = $lista['user_id'];
			$_SESSION['ADM']['user_nome'] = $lista['user_nome'];
			$_SESSION['ADM']['user_email'] = $lista['user_email'];
			$_SESSION['ADM']['user_pw'] = $lista['user_pw'];
			$_SESSION['ADM']['user_data'] = Sistema::DataAtualBR();
			$_SESSION['ADM']['user_hora'] = Sistema::HoraAtual();

			return TRUE;
			// caso o login seja incorreto
		else:

			echo '<h4 class="alert alert-danger"> O login incorreto </h4>';
			//  Rotas::Redirecionar(1,  Rotas::pag_ClienteLogin() );

			return FALSE;
		endif;

	}

/*Por ser estatico, poderá ser chamada sem instanciar a classe de login
 */
	static function Logado() {

		/*Se existir a sessão de clientes com e-mail valido, e houver uma ID vinculada ao cliente quer dizer que está logado
		 */
		if (isset($_SESSION['CLI']['cli_email']) && isset($_SESSION['CLI']['cli_id'])) {
			return TRUE;

		} else {
			return FALSE;
		}
	}

	/*Função estatica para não precisar instanciar
	*/
	static function LogadoADM() {
		if (isset($_SESSION['ADM']['user_nome']) && isset($_SESSION['ADM']['user_id'])) {
			return TRUE;

		} else {
			return FALSE;
		}
	}

	static function Logoff() {

		/*Destruir a sessão com unset, msg saindo, e manda pra página de login
		*/
		unset($_SESSION['CLI']);
		echo '<h4 class="alert alert-success"> Saindo... </h4>';
		Rotas::Redirecionar(2, Rotas::pag_ClienteLogin());
	}

	static function LogoffADM() {
		unset($_SESSION['ADM']);

		Rotas::Redirecionar(0, 'login.php');
	}

	//funcao para mostrar o menu do cliente
	static function MenuCliente() {

		/* Verifica se NÃO está logado

			$this é usado dentro da classe para acessar propriedades/métodos do objeto. self é usado para acessar membros estáticos.

		*/
		if (!self::Logado()):

			self::AcessoNegado();

			/*Manda pra página do Login
			*/
			Rotas::Redirecionar(2, Rotas::pag_ClienteLogin());

			/* caso nao redirecione por algum motivo, sai do bloco
			*/
			exit();
/* caso esteja logado mostra a tela minha conta
 */
		else:
			/* Cria os Assign
			*/
			$smarty = new Template();

			$smarty->assign('PAG_CONTA', Rotas::pag_ClienteConta());
			$smarty->assign('PAG_CARRINHO', Rotas::pag_Carrinho());
			$smarty->assign('PAG_LOGOFF', Rotas::pag_Logoff());
			$smarty->assign('PAG_CLIENTE_PEDIDOS', Rotas::pag_CLientePedidos());
			$smarty->assign('PAG_CLIENTE_DADOS', Rotas::pag_CLienteDados());
			$smarty->assign('PAG_CLIENTE_SENHA', Rotas::pag_CLienteSenha());
			$smarty->assign('USER', $_SESSION['CLI']['cli_nome']);

			$smarty->display('menu_cliente.tpl');

		endif;
	}

	private function setUser($user) {
		$this->user = $user;
	}

	/*Pode ser feita com MD5 ou com a função de Criptografia da classe Sistema*/
	private function setSenha($senha) {
		$this->senha = /*Sistema::Criptografia(*/md5($senha) /*)*/;
	}

	function getUser() {
		return $this->user;
	}

	function getSenha() {
		return $this->senha;
	}

}

?>