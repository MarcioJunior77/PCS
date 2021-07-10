class Tarefa {
  String? nome, descricao, grupo, prioridade, local, inicio, fim;
  int? feito;
  //Construtor
  Tarefa(String nome, String descricao, String grupo, String prioridade,
      String local, String inicio, String fim, int feito) {
    this.nome = nome;
    this.descricao = descricao;
    this.grupo = grupo;
    this.prioridade = prioridade;
    this.local = local;
    this.inicio = inicio;
    this.fim = fim;
    this.feito = feito;
  }
}

List listatarefas = [
  Tarefa("Refatoração 1", "Descrição 1", "TI", "Alta", "Empresa Principal",
      "09/02/2021 17:25:00", "09/02/2022 17:25:00", 1),
  Tarefa("Refatoração 2", "Descrição 2", "TI", "Média", "Empresa Principal",
      "10/02/2021 17:25:00", "10/02/2022 17:25:00", 1),
  Tarefa("Refatoração 3", "Descrição 3", "TI", "Baixa", "Empresa Principal",
      "11/02/2021 17:25:00", "11/02/2022 17:25:00", 0),
];
