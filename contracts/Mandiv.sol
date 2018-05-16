pragma solidity ^0.4.17;

contract Mandiv{

  //*****STRUCTS

  struct Usuario{
    string nome;
    string username;
    address sender;
    bool motorista;
    uint avaliacao;
    string endereco;
    bool ativo;
  }

  struct Motorista{
    //fotos ipfs
    address sender;
    uint avaliacao;
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

  struct HistoricoViagem{
    mapping(address=>uint) avaliacoes;
    Viagem viagem;
  }

  struct Passageiro{
    address sender;
    mapping(uint=>HistoricoViagem) historico;
    mapping(uint=>Convite) convites;
  }

  struct Convite{
    address passageiro;
    uint timestamp;
  }

  //*****VARIAVEIS DE ESTADO

  mapping(address=>Usuario) public usuarios;
  mapping(address=>Motorista) public motoristas;
  //mapping(address=>Usuario) public passageiros;

  //*****EVENTOS


  //*****FUNCOES

  //cadastro
  function cadastrar(string _nome, string _username, bool _motorista) public {
    require(usuarios[msg.sender].ativo == false);
    if(_motorista){
      motoristas[msg.sender] = Motorista(msg.sender,1000,true);
    }
    usuarios[msg.sender] = Usuario(_nome,_username,msg.sender,_motorista,100,"",true);
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

  function enviarConvite(address _motorista) public{
    require(motoristas[_motorista].ativo);

  }

}
