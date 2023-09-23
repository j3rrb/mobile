class Usuario {
  /// Atributos da classe
  String nome;
  String urlFoto;
  String telefone;
  String dataNascimento;
  String email;

  /// Construtor da classe
  Usuario({
    required this.nome,
    required this.urlFoto,
    required this.dataNascimento,
    required this.telefone,
    this.email = "usuario@mail.com"
  });

}