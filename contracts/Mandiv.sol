pragma solidity ^0.4.17;

contract Mandiv{

  //structs
  struct Usuario{
    string nome;
    string username;
    bool motorista;
    uint avaliacao;
    string endereco;
  }

  //variaveis
  mapping(address=>Usuario) public usuarios;

  //eventos


  //funcoes
  function cadastrar(string _nome, string _username, bool _motorista) public {
    require(usuarios[msg.sender].avaliacao == 0);
    usuarios[msg.sender] = Usuario(_nome,_username,_motorista,100);
  }

  function compareStrings (string a, string b) view returns (bool){
       return keccak256(a) == keccak256(b);
   }
}
