<?php

Class Config {

	//INFORMÃÇÕES BÁSICAS DO SITE HOSPEDADO
	const SITE_URL = "https://loja.io:8890";
	const SITE_PASTA = "";
	const SITE_NOME = "Loja Blue";
	const SITE_EMAIL_ADM = "xjogos@gmail.com";
	const BD_LIMIT_POR_PAG = 6;
	const SITE_CEP = '';

	//INFORMAÇÕES DO BANCO DE DADOS HOSPEDADO
	const BD_HOST = "localhost",
	BD_USER = "loja",
	BD_SENHA = "loja",
	BD_BANCO = "loja",
	BD_PREFIX = "ljb_";

	//*/

	//INFORMAÇÕES PARA PHP MAILLER
	const EMAIL_HOST = "";
	const EMAIL_USER = "nao-responda@blueservice.io";
	const EMAIL_CONTATO = "contato@blueservice.io";
	const EMAIL_COPIA = "xjogos@gmail.com";
	const EMAIL_NOME = "Contato Loja Blue";
	const EMAIL_SENHA = "";
	const EMAIL_PORTA = 587;
	const EMAIL_SMTPAUTH = true;
	const EMAIL_SMTPSECURE = "tls";

	//CONSTANTES PARA O PAGSEGURO
	const PS_EMAIL = ""; // email pagseguro
	const PS_TOKEN = ""; // token produção = venda
	const PS_TOKEN_SBX = ""; // token do sandbox = teste

	const PS_AMBIENTE = "production"; // production somente p transação   /  sandbox p teste

}
?>

