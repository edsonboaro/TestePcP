class UserModel
  attr_accessor :id, :name, :email, :gender, :status

  def to_hash
    {
      name: @name,
      email: @email,
      gender: @gender,
      status: @status,
    }
  end
end
