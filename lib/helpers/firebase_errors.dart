String getErrorString(String code) {
  switch (code) {
    case 'ERROR_WEAK_PASSWORD':
      return 'Sua senha é muito fraca.';
    case 'ERROR_INVALID_EMAIL':
      return 'Seu e-mail é inválido.';
    case 'ERROR_EMAIL_ALREADY_IN_USE':
      return 'E-mail já está sendo utilizado em outra conta.';
    case 'ERROR_INVALID_CREDENTIAL':
      return 'Seu e-mail é inválido.';
    case 'ERROR_WRONG_PASSWORD':
      return 'Sua senha está incorreta.';
    case 'ERROR_USER_NOT_FOUND':
      return 'Não há usuário com este e-mail.';
    case 'ERROR_USER_DISABLED':
      return 'Este usuário foi desabilitado.';
    case 'ERROR_TOO_MANY_REQUESTS':
      return 'Muitas solicitações. Tente novamente mais tarde.';
    case 'ERROR_OPERATION_NOT_ALLOWED':
      return 'Operação não permitida.';
    case 'user-disabled':
      return 'O usuário informado está desabilitado.';
    case 'user-not-found':
      return 'O usuário informado não está cadastrado.';
    case 'invalid-email':
      return 'O domínio do e-mail informado é inválido.';
    case 'wrong-password':
      return 'A senha informada está incorreta.';
    default:
      return 'Um erro indefinido ocorreu.';
  }
}
