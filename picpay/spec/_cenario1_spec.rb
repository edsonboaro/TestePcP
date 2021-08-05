describe "==> Criar Usuário" do
  context "Usar o endpoint de 'Criar um Usuário' para criar um usuário válido, e então validar se o mesmo foi criado no endpoint 'Listar todos Usuários'" do
    before do
      #Criando usuario original
      @user = build(:user).to_hash

      #Salvando Usuario com endpoint "Criar um usuario"
      @result = ApiUser.save(@user)

      #Validando retorno da EndPoint 'Listar todos Usuários'
      @validar = ApiUser.list(@result.parsed_response["data"])

      #Recuperando a Massa para novos testes sem dependencia
      @remover = ApiUser.remove(@result.parsed_response["data"]["id"])
    end

    it { expect(@remover.parsed_response["code"]).to eql 204 }
  end
end
