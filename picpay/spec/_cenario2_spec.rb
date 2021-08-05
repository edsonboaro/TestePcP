describe "==> Alterar Usuário" do
  context "Alterar o nome deste usuário criado com o endpoint 'Alterar dados do Usuário' e então validar as alterações no endpoint 'Listar um único Usuário'" do
    before do
      #Criando usuario original
      @user = build(:user).to_hash

      #Criando usuario que vai substituir o original
      @usernew = build(:usernew).to_hash

      #Salvando Usuario com endpoint "Criar um usuario"
      @result = ApiUser.save(@user)

      #Alterando Usuario para o novo
      @alterado = ApiUser.update(@result.parsed_response["data"]["id"], @usernew)

      #Validando retorno da EndPoint 'Listar um único Usuário'
      @validar = ApiUser.validate(@result.parsed_response["data"]["id"])

      #Recuperando a Massa para novos testes sem dependencia
      @remover = ApiUser.remove(@result.parsed_response["data"]["id"])
    end

    #Validando o retorno do endpoint de sucesso
    it { expect(@validar.parsed_response["code"]).to eql 200 }

    #Validando resposta do endpoint com o novo usuario alterado
    it { expect(@validar.parsed_response["data"]["name"]).to eql @usernew[:name] }

    #Validando que todos os registros continuam com os mesmos dados
    it { expect(@validar.parsed_response["data"]["id"]).to eql @result.parsed_response["data"]["id"] }
    it { expect(@validar.parsed_response["data"]["email"]).to eql @usernew[:email] }
    it { expect(@validar.parsed_response["data"]["gender"]).to eql @result.parsed_response["data"]["gender"] }
    it { expect(@validar.parsed_response["data"]["status"]).to eql @result.parsed_response["data"]["status"] }
  end
end
