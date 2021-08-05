describe "==> Criar Usuário" do
  context "Criar usuario aleatorio" do
    let(:user) { build(:userrandom).to_hash }
    let(:result) { ApiUser.save(user) }

    it { expect(result.parsed_response["code"]).to eql 201 }
  end
end
