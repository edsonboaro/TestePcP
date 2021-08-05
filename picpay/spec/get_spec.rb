describe "==> GET" do
  context "Buscando apenas 1 usuario" do
    let(:user) { build(:userrandom).to_hash }
    let(:result) { ApiUser.save(user) }
    let(:validar) { ApiUser.validate(result.parsed_response["data"]["id"]) }

    it { expect(validar.response.code).to eql "200" }
  end

  context "Listando todos os usuarios" do
    let(:user) { build(:userrandom).to_hash }
    let(:result) { ApiUser.save(user) }
    let(:listar) { ApiUser.full() }

    it { expect(listar.response.code).to eql "200" }
  end
end
