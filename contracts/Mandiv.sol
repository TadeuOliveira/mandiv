pragma solidity ^0.4.17;

contract Mandiv{

  //structs
  struct Usuario{
    string nome;
    string username;
    bool motorista;
    uint avaliacao;
    string endereco;
    bool ativo;
  }

  struct Motorista{
    //fotos ipfs
    uint avaliacao;
    uint timestamp; //converter para date com js
    bool ativo;
  }

  struct Endereco{
    string pais;
    string estado;
    string cidade;
    string bairro;
    string rua;
    uint num;
    uint complemento;
  }

  struct Itinerario{
    mapping(uint=>Endereco) pontos;
    uint numPontos;
    mapping(uint=>Endereco) passageiros;
    uint numPassageiros;
  }

  struct Viagem{
    Itinerario itinerario;
    address motorista;
    uint timestamp;
  }

  struct HistoricoViagens{
    Viagem[] viagens;
  }

  //*****VARIAVEIS
  mapping(address=>Usuario) public usuarios;
  mapping(address=>Motorista) public motoristas;
  mapping(address=>HistoricoViagens) public viagens;

  //*****EVENTOS


  //*****FUNCOES

  //cadastro
  function cadastrar(string _nome, string _username, bool _motorista) public {
    require(usuarios[msg.sender].ativo == false);
    if(_motorista){
      motoristas[msg.sender] = Motorista(1000,now,true);
    }
    usuarios[msg.sender] = Usuario(_nome,_username,_motorista,100,"",true);
  }

  function deletarConta() public {
    usuarios[msg.sender].ativo = false;
    if(usuarios[msg.sender].motorista){
      motoristas[msg.sender].ativo = false;
    }
  }

  function atualizaDados(string _username, string _endereco) public {
    usuarios[msg.sender].username = _username;
    usuarios[msg.sender].endereco = _endereco;
  }

  //viagem


  //temporarias

  //utilitarios
  function compareStrings (string a, string b) view returns (bool) {
       return keccak256(a) == keccak256(b);
   }

   function getSender() public constant returns(address) {
    return msg.sender;
   }
}
