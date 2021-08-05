describe "==> PUT" do
  context "Alterar usuario aleatorio" do
    let(:user) { build(:userrandom).to_hash }
    let(:usernew) { build(:userrandom).to_hash }
    let(:result) { ApiUser.save(user) }
    let(:alterado) { ApiUser.update(result.parsed_response["data"]["id"], usernew) }

    it { expect(alterado.parsed_response["code"]).to eql 200 }
  end
end
