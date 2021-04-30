FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              { '1a' + Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name             {'あああ'}
    first_name            {'いいい'}
    last_name_ruby        {'ウウウ'}
    first_name_ruby       {'エエエ'}
    birthday              {'1980-11-11'}
  end
end