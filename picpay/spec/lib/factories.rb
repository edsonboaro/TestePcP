require "faker"
require_relative "../models/user_model"

FactoryBot.define do
  factory :user, class: UserModel do
    name { "Usuario PicPay" }
    email { "usuario100@teste.com" }
    gender { "Male" }
    status { "Active" }
  end

  factory :usernew, class: UserModel do
    name { "Novo Usuario" }
    email { "usuario200@teste.com" }
    gender { "Male" }
    status { "Active" }
  end

  factory :userrandom, class: UserModel do
    name { "Usuario de Teste " + rand(9999).to_s }
    email { "emailteste" + rand(999999).to_s + "@teste.com" }
    gender { "Female" }
    status { "Inactive" }
  end
end
