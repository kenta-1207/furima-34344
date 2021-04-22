FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(numbeer: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::internet.password(min_length: 6)}
    password_confirmation {password}
    last_name             {'あああ'}
    first_name            {'いいい'}
    last_name_ruby        {'ううう'}
    first_name_ruby       {'えええ'}
    birthday              {'19801111'}
  end
end