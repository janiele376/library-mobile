// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get appTitle => 'Biblioteca';

  @override
  String get welcome => 'Bem Vindo!';

  @override
  String get loginDescription => 'Faça login para acessar sua biblioteca';

  @override
  String get email => 'E-mail';

  @override
  String get password => 'Senha';

  @override
  String get forgotPassword => 'Esqueci Senha';

  @override
  String get login => 'Entrar';

  @override
  String get register => 'Cadastre-se';

  @override
  String get or => 'ou';

  @override
  String get aboutUs => 'Sobre Nós';

  @override
  String get aboutDescription =>
      'Nossa missão é informar você aos seus produtos com praticidade.';

  @override
  String get contactUs => 'Contate-nos';

  @override
  String get ourLocations => 'Nossos Locais';

  @override
  String get locationOne => 'Rua Padre Filho, 263 - Centro.';

  @override
  String get locationTwo => 'Rua IV, 60 - Paulista.';

  @override
  String get locationThree => 'Rua Norte Europeu, 110 - Vale Central.';

  @override
  String get createAccount => 'Criar Conta';

  @override
  String get registerTitle => 'Cadastro';

  @override
  String get registerDescription =>
      'Preencha os dados abaixo para criar sua conta.';

  @override
  String get fullName => 'Nome completo';

  @override
  String get birthDateHint => 'DD/MM/AAAA';

  @override
  String get emailHint => 'Usuario@gmail.com';

  @override
  String get cpfHint => '000.000.000-00';

  @override
  String get phoneHint => '+99 99999-9999';

  @override
  String get addressHint => 'Logradouro, Nº - Bairro';

  @override
  String get confirmPassword => 'Confirmar senha';

  @override
  String get registerAction => 'Cadastrar';

  @override
  String get alreadyHaveAccount => 'Já possui uma conta? Entrar';

  @override
  String get cancel => 'Cancelar';

  @override
  String get requiredField => 'Campo obrigatório';

  @override
  String get invalidEmail => 'Informe um e-mail válido';

  @override
  String get passwordMinLength => 'A senha deve ter pelo menos 8 caracteres';

  @override
  String get passwordsDoNotMatch => 'As senhas não coincidem';

  @override
  String get loginTitle => 'Login';

  @override
  String get forgotPasswordTitle => 'Recuperar Senha';

  @override
  String get forgotPasswordDescription =>
      'Informe suas credenciais para recuperar o acesso.';

  @override
  String get newPassword => 'Senha';

  @override
  String get recoverPassword => 'Recuperar';

  @override
  String get connectionTimeout => 'Tempo de conexão esgotado.';

  @override
  String get serverConnectionError => 'Não foi possível conectar ao servidor.';

  @override
  String get invalidCredentials => 'E-mail ou senha inválidos.';

  @override
  String get loginError =>
      'Não foi possível realizar o login. Tente novamente.';

  @override
  String get registerSuccess => 'Conta criada com sucesso!';

  @override
  String get registerError =>
      'Não foi possível criar a conta. Verifique os dados ou se o e-mail/CPF já está cadastrado.';

  @override
  String get passwordRecoverySuccess => 'Senha alterada com sucesso!';

  @override
  String get passwordRecoveryError =>
      'Não foi possível alterar a senha. Verifique os dados.';

  @override
  String get invalidName => 'Informe um nome válido';

  @override
  String get invalidCpf => 'CPF inválido';

  @override
  String get invalidPhone => 'Telefone inválido. Informe o DDD.';

  @override
  String get invalidBirthDate => 'Data de nascimento inválida';

  @override
  String get invalidAddress => 'Informe um endereço válido';

  @override
  String get dashboardTitle => 'Dashboard';

  @override
  String get dashboardGlobalStats => 'Quantitativos Globais';

  @override
  String get dashboardTotalRentals => 'Aluguéis Realizados';

  @override
  String get dashboardTotalBooks => 'Livros Cadastrados';

  @override
  String get dashboardTotalPublishers => 'Editoras Cadastradas';

  @override
  String get dashboardRentalStatus => 'Status dos Aluguéis';

  @override
  String get dashboardOnTime => 'Em Dia';

  @override
  String get dashboardNearDue => 'Perto do Vencimento';

  @override
  String get dashboardOverdue => 'Atrasado';

  @override
  String get dashboardLastRentals => 'Últimos Livros Alugados';

  @override
  String get dashboardMostRentedBook => 'Livro Mais Alugado';

  @override
  String get dashboardAvailableBooks => 'Livros Disponíveis';

  @override
  String dashboardTotalAvailableBooks(int count) {
    return 'Total de livros: $count';
  }

  @override
  String get dashboardPublisher => 'Editora';

  @override
  String get dashboardReleaseDate => 'Data de Lançamento';

  @override
  String get dashboardQuantity => 'Quantidade';

  @override
  String get dashboardRentalQuantity => 'Quantidade de Aluguéis';

  @override
  String get dashboardNoRentals => 'Nenhum empréstimo encontrado.';

  @override
  String get dashboardNoBooks => 'Nenhum livro encontrado.';

  @override
  String get dashboardNoAvailableBooks => 'Nenhum livro disponível.';

  @override
  String get dashboardNoData => 'Nenhum dado disponível.';

  @override
  String get dashboardLoadError => 'Não foi possível carregar a Dashboard.';

  @override
  String get dashboardRetry => 'Tentar novamente';

  @override
  String get dashboardViewMore => 'VER MAIS';

  @override
  String get dashboardStatusNearDue => 'Próximo do vencimento';

  @override
  String get dashboardAccessibilityUnavailable =>
      'Página de acessibilidade em desenvolvimento.';

  @override
  String get dashboardProfileUnavailable =>
      'Página de perfil ainda não configurada.';

  @override
  String get dashboardAdminAreaUnavailable =>
      'Área administrativa ainda não configurada.';

  @override
  String get settingsTitle => 'Configurações';

  @override
  String get accessibilityTitle => 'Personalize sua experiência';

  @override
  String get accessibilityDescription =>
      'Configure a aparência e a leitura do aplicativo.';

  @override
  String get accessibilityThemeTitle => 'Tema do aplicativo';

  @override
  String get accessibilityThemeDescription =>
      'Escolha a aparência do aplicativo.';

  @override
  String get themeLight => 'Claro';

  @override
  String get themeDark => 'Escuro';

  @override
  String get themeSystem => 'Seguir sistema';

  @override
  String get accessibilityFontSizeTitle => 'Tamanho da fonte';

  @override
  String get accessibilityFontSizeDescription => 'Ajuste o tamanho dos textos.';

  @override
  String get accessibilityFontSmall => 'Pequeno';

  @override
  String get accessibilityFontLarge => 'Grande';

  @override
  String get accessibilityFontPreview =>
      'Exemplo de texto para visualizar o tamanho selecionado.';

  @override
  String get accessibilityLanguageTitle => 'Idioma';

  @override
  String get accessibilityLanguageDescription =>
      'Selecione o idioma do aplicativo.';

  @override
  String get languagePortuguese => 'Português';

  @override
  String get languageEnglish => 'Inglês';

  @override
  String get languageSpanish => 'Espanhol';

  @override
  String get phone => 'Telefone';

  @override
  String get address => 'Endereço';

  @override
  String get cpf => 'CPF';

  @override
  String get birthDate => 'Data de nascimento';

  @override
  String get needHelp => 'Precisa de ajuda?';

  @override
  String get currentPassword => 'Senha atual';

  @override
  String get newPasswordOptional => 'Nova senha (opcional)';

  @override
  String get confirmNewPassword => 'Confirmar nova senha';

  @override
  String get profileLoadError => 'Não foi possível carregar seu perfil.';

  @override
  String get retry => 'Tentar novamente';

  @override
  String get profileNotFound => 'Perfil não encontrado.';

  @override
  String get profileUpdated => 'Perfil atualizado com sucesso!';

  @override
  String get profileUpdateError =>
      'Não foi possível atualizar. Verifique sua senha atual e tente novamente.';

  @override
  String get editInformation => 'Editar informações';

  @override
  String get confirm => 'Confirmar';

  @override
  String get requestSent => 'Solicitação enviada com sucesso!';

  @override
  String get helpEmailRequired => 'Informe seu e-mail.';

  @override
  String get helpSubjectRequired => 'Informe o assunto.';

  @override
  String get subject => 'Assunto';

  @override
  String get send => 'Enviar';

  @override
  String get personalInformation => 'Informações pessoais';

  @override
  String get menuTitle => 'MENU';

  @override
  String get adminAreaTitle => 'Área do ADM';

  @override
  String get logout => 'Sair';

  @override
  String get logoutConfirmation => 'Deseja sair do sistema?';

  @override
  String get usersTab => 'Usuários';

  @override
  String get rentalsTab => 'Aluguéis';

  @override
  String get booksTab => 'Livros';

  @override
  String get publishersTab => 'Editoras';

  @override
  String get adminSearchHint => 'Pesquisar...';

  @override
  String get filters => 'Filtros';

  @override
  String get previousPage => 'Página anterior';

  @override
  String get nextPage => 'Próxima página';

  @override
  String get view => 'Visualizar';

  @override
  String get edit => 'Editar';

  @override
  String get delete => 'Excluir';

  @override
  String get renew => 'Renovar';

  @override
  String get returnBook => 'Devolver';

  @override
  String get userName => 'Nome do Usuário';

  @override
  String get actions => 'Ações';

  @override
  String get save => 'Salvar';

  @override
  String get cnpj => 'CNPJ';

  @override
  String get publisherName => 'Nome da editora';

  @override
  String get bookTitle => 'Título do livro';

  @override
  String get bookIsbn => 'ISBN';

  @override
  String get bookGenre => 'Gênero';

  @override
  String get bookPublisher => 'Editora';

  @override
  String get bookReleaseDate => 'Data de lançamento';

  @override
  String get bookQuantity => 'Quantidade';

  @override
  String get bookCreateTitle => 'Cadastrar livro';

  @override
  String get bookEditTitle => 'Editar livro';

  @override
  String get bookDeleteTitle => 'Excluir livro';

  @override
  String get bookDeleteConfirmation =>
      'Tem certeza de que deseja excluir este livro?';

  @override
  String get bookSearchHint => 'Pesquisar por título, gênero ou ISBN';

  @override
  String get bookLoadError => 'Não foi possível carregar os livros.';

  @override
  String get bookCreateSuccess => 'Livro cadastrado com sucesso!';

  @override
  String get bookUpdateSuccess => 'Livro atualizado com sucesso!';

  @override
  String get bookDeleteSuccess => 'Livro excluído com sucesso.';

  @override
  String get bookPublisherRequired => 'Selecione uma editora.';

  @override
  String get bookQuantityRequired => 'Informe a quantidade.';

  @override
  String get bookQuantityInvalid => 'A quantidade não pode ser negativa.';

  @override
  String get noResults => 'Nenhum livro encontrado.';

  @override
  String get rentalTitle => 'Aluguel';

  @override
  String get rentalUser => 'Usuário';

  @override
  String get rentalBook => 'Livro';

  @override
  String get rentalStartDate => 'Data de início';

  @override
  String get rentalEndDate => 'Data de devolução';

  @override
  String get rentalStatus => 'Status';

  @override
  String get rentalCreateTitle => 'Cadastrar aluguel';

  @override
  String get rentalEditTitle => 'Editar aluguel';

  @override
  String get rentalDeleteTitle => 'Excluir aluguel';

  @override
  String get rentalDeleteConfirmation =>
      'Tem certeza de que deseja excluir este aluguel?';

  @override
  String get rentalSearchHint => 'Pesquisar por usuário ou livro...';

  @override
  String get rentalLoadError => 'Erro ao carregar aluguéis.';

  @override
  String get rentalCreateSuccess => 'Aluguel cadastrado com sucesso!';

  @override
  String get rentalUpdateSuccess => 'Aluguel atualizado com sucesso!';

  @override
  String get rentalDeleteSuccess => 'Aluguel excluído com sucesso!';

  @override
  String get rentalRenewSuccess => 'Aluguel renovado com sucesso!';

  @override
  String get rentalReturnSuccess => 'Livro devolvido com sucesso!';

  @override
  String get rentalUserRequired => 'Selecione um usuário.';

  @override
  String get rentalBookRequired => 'Selecione um livro.';

  @override
  String get rentalRenewConfirmation => 'Deseja renovar este aluguel?';

  @override
  String get rentalReturnConfirmation =>
      'Deseja confirmar a devolução deste livro?';

  @override
  String get rentalNoResults => 'Nenhum aluguel encontrado.';

  @override
  String get rentalStatusActive => 'Ativo';

  @override
  String get rentalStatusDueSoon => 'Próximo do vencimento';

  @override
  String get rentalStatusLate => 'Atrasado';

  @override
  String get rentalStatusReturned => 'Devolvido';

  @override
  String get userDeleteTitle => 'Excluir usuário';

  @override
  String get userDeleteConfirmation =>
      'Tem certeza de que deseja excluir este usuário?';

  @override
  String get userDeleteIrreversible => 'Essa ação não poderá ser desfeita.';

  @override
  String get rentalEditSubtitle => 'Altere o usuário ou o livro do aluguel';

  @override
  String get close => 'Fechar';

  @override
  String get rentalDeleteIrreversible => 'Essa ação não poderá ser desfeita.';

  @override
  String get rentalCreateSubtitle => 'Selecione o usuário e o livro';

  @override
  String get bookDeleteIrreversible => 'Essa ação não poderá ser desfeita.';

  @override
  String get bookCreateSubtitle => 'Preencha os dados do novo livro';

  @override
  String get publisherCreateTitle => 'Cadastrar editora';

  @override
  String get publisherCreateSubtitle => 'Preencha os dados da nova editora';

  @override
  String get publisherDeleteTitle => 'Excluir editora';

  @override
  String get publisherDeleteConfirmation =>
      'Tem certeza de que deseja excluir esta editora?';

  @override
  String get publisherDeleteIrreversible =>
      'Essa ação não poderá ser desfeita.';

  @override
  String get publisherPageTitle => 'Editoras';

  @override
  String get publisherCreateSuccess => 'Editora cadastrada com sucesso!';

  @override
  String get publisherCreateError => 'Erro ao cadastrar editora.';

  @override
  String get publisherUpdateSuccess => 'Editora atualizada com sucesso!';

  @override
  String get publisherUpdateError => 'Erro ao atualizar editora.';

  @override
  String get publisherDeleteSuccess => 'Editora excluída com sucesso!';

  @override
  String get publisherDeleteError => 'Erro ao excluir editora.';

  @override
  String get publisherNoResults => 'Nenhuma editora encontrada.';

  @override
  String get publisherLoadError => 'Não foi possível carregar as editoras.';

  @override
  String get bookLoadPublisherError =>
      'Não foi possível carregar a editora atual.';

  @override
  String get bookSearchPublisherError => 'Não foi possível pesquisar editoras.';

  @override
  String get bookSelectPublisherError => 'Selecione uma editora.';

  @override
  String get bookNoPublishersFound => 'Nenhuma editora encontrada.';

  @override
  String fieldRequired(String field) {
    return '$field é obrigatório.';
  }

  @override
  String get bookIsbnMaxLength => 'O ISBN deve ter no máximo 13 dígitos.';

  @override
  String get bookDateFormat => 'Informe a data no formato dd/MM/aaaa.';

  @override
  String get bookDateInvalid => 'Informe uma data válida.';

  @override
  String get publisherEditTitle => 'Editar editora';

  @override
  String get rentalSearchUserHint => 'Pesquisar usuário pelo nome';

  @override
  String get rentalNoUsersFound => 'Nenhum usuário encontrado.';

  @override
  String get rentalSearchBookHint => 'Pesquisar livro pelo título';

  @override
  String rentalAvailableStock(int quantity) {
    return 'Estoque disponível: $quantity';
  }

  @override
  String get rentalNoBooksAvailable => 'Nenhum livro disponível encontrado.';

  @override
  String get userLoadError => 'Não foi possível carregar os usuários.';

  @override
  String get userNoResults => 'Nenhum usuário encontrado.';

  @override
  String get userUpdateSuccess => 'Usuário atualizado com sucesso!';

  @override
  String userUpdateError(String error) {
    return 'Erro ao atualizar usuário: $error';
  }

  @override
  String get userDeleteSuccess => 'Usuário excluído com sucesso!';

  @override
  String userDeleteError(String error) {
    return 'Erro ao excluir usuário: $error';
  }

  @override
  String get userEditTitle => 'Editar usuário';

  @override
  String get settingsLoadError => 'Não foi possível carregar as configurações.';

  @override
  String get profile => 'Perfil';

  @override
  String get accessibility => 'Acessibilidade';

  @override
  String get back => 'Voltar';
}
