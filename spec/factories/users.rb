FactoryBot.define do
  factory :user do
    nickname              {'shi-mo'}
    email                 {Faker::Internet.free_email}
    password              {'1popopo'}
    password_confirmation {password}
    last_name             {'下田'}
    first_name            {'かげき'}
    last_name_kana        {'シモダ'}
    first_name_kana       {'カゲキ'}
    birth_date            {'2000-01-01'}
  end
end