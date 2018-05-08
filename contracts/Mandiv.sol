pragma solidity ^0.4.17;

contract Mandiv{

  struct Usuario{
    string nome;
    bool motorista;
    uint avaliacao;
  }

  mapping(address=>Usuario) public usuarios;

  function cadastrar(string _nome,bool _motorista) public {
    require(usuarios[msg.sender].avaliacao == 0);
    usuarios[msg.sender] = Usuario(_nome,_motorista,100);
  }
}
