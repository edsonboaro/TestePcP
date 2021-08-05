describe "==> Deletar Usuario" do
  context "Deletar o usuário criado no endpoint 'Deletar Usuario' e validar se o mesmo foi removido no endpoint 'Listar todos Usuários''" do
    before do
      #Criando usuario original
      @user = build(:user).to_hash

      #Salvando Usuario com endpoint "Criar um usuario"
      @result = ApiUser.save(@user)

      #Salvando Usuario com endpoint "Criar um usuario"
      @remover = ApiUser.remove(@result.parsed_response["data"]["id"])

      #Validando retorno da EndPoint 'Listar um único Usuário'
      @validar = ApiUser.list(@result.parsed_response["data"])
    end
    it { expect(@remover.parsed_response["code"]).to eql 204 }
  end
end
