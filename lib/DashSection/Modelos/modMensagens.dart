class Mensagem {
  String? remetente, conteudo, nomegrupo;
  int? horario, lido, grupo;
  //Construtor
  Mensagem(String remetente, String conteudo, String nomegrupo, int horario,
      int lido, int grupo) {
    this.remetente = remetente;
    this.conteudo = conteudo;
    this.nomegrupo = nomegrupo;
    this.horario = horario;
    this.lido = lido;
    this.grupo = grupo;
  }
}

List listamensagens = [
  Mensagem("Ana", "AAAAAA", "Grupo de Vendas", 1700, 0, 1),
  Mensagem("Bob", "BBBBBB", "", 1700, 0, 0),
  Mensagem("Carlos", "CCCCCC", "", 1700, 0, 0),
];
