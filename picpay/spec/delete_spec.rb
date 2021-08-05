describe "==> Deletar Usuario" do
  context "Criando usuario Aleatório e excluindo" do
    let(:user) { build(:userrandom).to_hash }
    let(:usernew) { build(:userrandom).to_hash }
    let(:result) { ApiUser.save(user) }
    let(:remover) { ApiUser.remove(result.parsed_response["data"]["id"]) }

    it { expect(remover.parsed_response["code"]).to eql 204 }
  end
end
