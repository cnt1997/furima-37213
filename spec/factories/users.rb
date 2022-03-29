FactoryBot.define do 
  factory :user do
    password { '1a' + Faker::Internet.password(min_length: 4) }
    password_confirmation {password}
    email             {Faker::Internet.email}
    nickname          {Faker::Name.name}
    familyname        {Gimei.last}
    firstname         {Gimei.first}
    familyname_katakana  {familyname.katakana}
    firstname_katakana   {firstname.katakana}
    birthday          {Faker::Date.between(from: '1930-01-01',to: "2000-12-31")}
  end
end
