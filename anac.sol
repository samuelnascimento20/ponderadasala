// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Anac {
    // Variável de estado para armazenar a idade padrão
    uint256 public idadePadrao = 18;
    
    // Variável para o endereço do dono do contrato
    address private  donoContratoAnac;
    
    // Modificador para restringir o acesso a determinadas funções apenas ao dono do contrato
    modifier somenteDono() {
        require(msg.sender == donoContratoAnac, "Apenas o proprietario do contrato pode executar esta operacao");
        _;
    }
    
    constructor() {
        idadePadrao = 18;
        donoContratoAnac = msg.sender;
    }
    
    /**
     * @dev Função para definir a idade (acessível apenas pelo dono do contrato)
     * @param novaIdade Novo valor para a idade
     */
    function atribuirIdade(uint novaIdade) public somenteDono {
        idadePadrao = novaIdade;
    }
    
    /**
     * @dev Função para obter a idade (função de consulta)
     * @return O valor atual da idade
     */
    function obterIdade() public view returns (uint) {
        return idadePadrao;
    }
}
