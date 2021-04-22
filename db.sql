-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Apr 22, 2021 at 03:26 PM
-- Server version: 5.7.26
-- PHP Version: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `loja`
--

-- --------------------------------------------------------

--
-- Table structure for table `ljb_categorias`
--

CREATE TABLE `ljb_categorias` (
                                  `cate_id` int(11) UNSIGNED NOT NULL,
                                  `cate_nome` varchar(255) NOT NULL,
                                  `cate_slug` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ljb_categorias`
--

INSERT INTO `ljb_categorias` (`cate_id`, `cate_nome`, `cate_slug`) VALUES
(1, 'Softweares', 'softweares');

-- --------------------------------------------------------

--
-- Table structure for table `ljb_clientes`
--

CREATE TABLE `ljb_clientes` (
                                `cli_id` int(11) UNSIGNED NOT NULL,
                                `cli_nome` varchar(255) DEFAULT NULL,
                                `cli_sobrenome` varchar(255) DEFAULT NULL,
                                `cli_endereco` varchar(255) DEFAULT NULL,
                                `cli_numero` varchar(255) DEFAULT NULL,
                                `cli_bairro` varchar(255) DEFAULT NULL,
                                `cli_cidade` varchar(255) DEFAULT NULL,
                                `cli_uf` varchar(255) DEFAULT NULL,
                                `cli_cep` varchar(255) DEFAULT NULL,
                                `cli_cpf` varchar(255) DEFAULT NULL,
                                `cli_rg` varchar(255) DEFAULT NULL,
                                `cli_ddd` int(2) DEFAULT NULL,
                                `cli_fone` varchar(255) DEFAULT NULL,
                                `cli_celular` varchar(255) DEFAULT NULL,
                                `cli_email` varchar(255) DEFAULT NULL,
                                `cli_pass` varchar(255) DEFAULT NULL,
                                `cli_data_nasc` date DEFAULT NULL,
                                `cli_data_cad` date DEFAULT NULL,
                                `cli_hora_cad` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ljb_clientes`
--

INSERT INTO `ljb_clientes` (`cli_id`, `cli_nome`, `cli_sobrenome`, `cli_endereco`, `cli_numero`, `cli_bairro`, `cli_cidade`, `cli_uf`, `cli_cep`, `cli_cpf`, `cli_rg`, `cli_ddd`, `cli_fone`, `cli_celular`, `cli_email`, `cli_pass`, `cli_data_nasc`, `cli_data_cad`, `cli_hora_cad`) VALUES
(1, 'João Coelho', 'Garcias Neto', 'Aen', 'sddsf', 'sdfsd', 'sdfsd', 'CE', '63180', '033330', '20202', 88, '99999', '99999', 'xjogos@gmail.com', '25d55ad283aa400af464c76d713c07ad', '2021-04-22', '2021-04-22', '15:09:31');

-- --------------------------------------------------------

--
-- Table structure for table `ljb_estados`
--

CREATE TABLE `ljb_estados` (
                               `estado_id` int(11) UNSIGNED NOT NULL,
                               `estado_sigla` varchar(2) NOT NULL,
                               `estado_nome` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ljb_imagens`
--

CREATE TABLE `ljb_imagens` (
                               `img_id` int(11) UNSIGNED NOT NULL,
                               `img_nome` varchar(255) NOT NULL,
                               `img_pro_id` int(11) UNSIGNED NOT NULL,
                               `img_pasta` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ljb_pedidos`
--

CREATE TABLE `ljb_pedidos` (
                               `ped_id` int(11) UNSIGNED NOT NULL,
                               `ped_data` date NOT NULL,
                               `ped_hora` time NOT NULL,
                               `ped_cliente` int(11) UNSIGNED NOT NULL,
                               `ped_cod` varchar(255) NOT NULL,
                               `ped_ref` varchar(255) NOT NULL,
                               `ped_pag_status` varchar(255) NOT NULL,
                               `ped__pag_forma` varchar(255) NOT NULL,
                               `ped_pag_tipo` varchar(255) NOT NULL,
                               `ped_pag_codigo` varchar(255) NOT NULL,
                               `ped_frete_valor` double(10,2) NOT NULL,
  `ped_frete_tipo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ljb_pedidos_itens`
--

CREATE TABLE `ljb_pedidos_itens` (
                                     `item_id` int(11) UNSIGNED NOT NULL,
                                     `item_produto` int(11) UNSIGNED NOT NULL,
                                     `item_valor` double(10,2) NOT NULL,
  `item_qtd` int(11) NOT NULL,
  `item_ped_cod` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ljb_produtos`
--

CREATE TABLE `ljb_produtos` (
                                `pro_id` int(11) UNSIGNED NOT NULL,
                                `pro_categoria` int(11) DEFAULT NULL,
                                `pro_nome` varchar(255) DEFAULT NULL,
                                `pro_desc` text,
                                `pro_peso` double(10,2) DEFAULT NULL,
  `pro_valor` double(10,2) DEFAULT NULL,
  `pro_altura` int(11) DEFAULT NULL,
  `pro_largura` int(11) DEFAULT NULL,
  `pro_comprimento` int(11) DEFAULT NULL,
  `pro_img` varchar(255) DEFAULT NULL,
  `pro_slug` varchar(255) DEFAULT NULL,
  `pro_estoque` int(11) DEFAULT NULL,
  `pro_modelo` varchar(255) DEFAULT NULL,
  `pro_ref` varchar(255) DEFAULT NULL,
  `pro_fabricante` int(11) DEFAULT NULL,
  `pro_ativo` varchar(255) DEFAULT NULL,
  `pro_frete_free` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ljb_produtos`
--

INSERT INTO `ljb_produtos` (`pro_id`, `pro_categoria`, `pro_nome`, `pro_desc`, `pro_peso`, `pro_valor`, `pro_altura`, `pro_largura`, `pro_comprimento`, `pro_img`, `pro_slug`, `pro_estoque`, `pro_modelo`, `pro_ref`, `pro_fabricante`, `pro_ativo`, `pro_frete_free`) VALUES
(1, 1, 'BPMN', '<p>Descri&ccedil;&atilde;o</p>', 4.00, 9000000.00, 3, 2, 2, '210422151939whatsapp-image-2021-04-22-at-08.53.48.png.png', 'bpmn', 20000, '3.3', '4343', NULL, 'SIM', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ljb_users`
--

CREATE TABLE `ljb_users` (
                             `user_id` int(11) UNSIGNED NOT NULL,
                             `user_nome` varchar(255) NOT NULL,
                             `user_email` varchar(255) NOT NULL,
                             `user_pw` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ljb_users`
--

INSERT INTO `ljb_users` (`user_id`, `user_nome`, `user_email`, `user_pw`) VALUES
(1, 'João', 'xjogos@gmail.com', '25d55ad283aa400af464c76d713c07ad');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ljb_categorias`
--
ALTER TABLE `ljb_categorias`
    ADD PRIMARY KEY (`cate_id`);

--
-- Indexes for table `ljb_clientes`
--
ALTER TABLE `ljb_clientes`
    ADD PRIMARY KEY (`cli_id`);

--
-- Indexes for table `ljb_estados`
--
ALTER TABLE `ljb_estados`
    ADD PRIMARY KEY (`estado_id`);

--
-- Indexes for table `ljb_imagens`
--
ALTER TABLE `ljb_imagens`
    ADD PRIMARY KEY (`img_id`),
  ADD KEY `fk_produto_id` (`img_pro_id`) USING BTREE;

--
-- Indexes for table `ljb_pedidos`
--
ALTER TABLE `ljb_pedidos`
    ADD PRIMARY KEY (`ped_id`),
  ADD KEY `fk_cliente_id` (`ped_cliente`);

--
-- Indexes for table `ljb_pedidos_itens`
--
ALTER TABLE `ljb_pedidos_itens`
    ADD PRIMARY KEY (`item_id`);

--
-- Indexes for table `ljb_produtos`
--
ALTER TABLE `ljb_produtos`
    ADD PRIMARY KEY (`pro_id`);

--
-- Indexes for table `ljb_users`
--
ALTER TABLE `ljb_users`
    ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ljb_categorias`
--
ALTER TABLE `ljb_categorias`
    MODIFY `cate_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ljb_clientes`
--
ALTER TABLE `ljb_clientes`
    MODIFY `cli_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ljb_estados`
--
ALTER TABLE `ljb_estados`
    MODIFY `estado_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ljb_imagens`
--
ALTER TABLE `ljb_imagens`
    MODIFY `img_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ljb_pedidos`
--
ALTER TABLE `ljb_pedidos`
    MODIFY `ped_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ljb_pedidos_itens`
--
ALTER TABLE `ljb_pedidos_itens`
    MODIFY `item_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ljb_produtos`
--
ALTER TABLE `ljb_produtos`
    MODIFY `pro_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ljb_users`
--
ALTER TABLE `ljb_users`
    MODIFY `user_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ljb_imagens`
--
ALTER TABLE `ljb_imagens`
    ADD CONSTRAINT `fk_produto_id` FOREIGN KEY (`img_pro_id`) REFERENCES `ljb_produtos` (`pro_id`);

--
-- Constraints for table `ljb_pedidos`
--
ALTER TABLE `ljb_pedidos`
    ADD CONSTRAINT `fk_cliente_id` FOREIGN KEY (`ped_cliente`) REFERENCES `ljb_clientes` (`cli_id`);
