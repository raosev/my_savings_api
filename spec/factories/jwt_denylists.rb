FactoryBot.define do
  factory :jwt_denylist do
    jti { "MyString" }
    exp { "2022-08-07 10:51:02" }
  end
end
