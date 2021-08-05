describe "==> Passar por todos os passos" do
  context "Criar / Alterar e Deletar usuarios" do
    before do
      #Criando usuario original
      @user = build(:user).to_hash

      #Salvando Usuario com endpoint "Criar um usuario"
      @result = ApiUser.save(@user)

      #Validando retorno da EndPoint 'Listar todos Usuários'
      @validar = ApiUser.list(@result.parsed_response["data"])

      #Alterando Usuario para o novo
      @alterado = ApiUser.update(@result.parsed_response["data"]["id"], @usernew)

      #Validando retorno da EndPoint 'Listar um único Usuário'
      @validar = ApiUser.validate(@result.parsed_response["data"]["id"])

      #Recuperando a Massa para novos testes sem dependencia
      @remover = ApiUser.remove(@result.parsed_response["data"]["id"])

      #Validando retorno da EndPoint 'Listar um único Usuário'
      @validar = ApiUser.list(@result.parsed_response["data"])
    end

    it { expect(@remover.parsed_response["code"]).to eql 204 }
  end
end
