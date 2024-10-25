abstract class RegisterPageEvent {}

class RegisterUserEvent extends RegisterPageEvent {
  final String? email;
  final String? cpf;
  final String? cnpj;
  final String? rg;
  final String? endereco;
  final String? nome;
  final String? senha;
  final String? type;
  final bool? ativo;

  RegisterUserEvent(
      {this.email,
      this.cpf,
      this.cnpj,
      this.rg,
      this.endereco,
      this.nome,
      this.senha,
      this.type,
      this.ativo});
}
