FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@example'}
    password              {'1popopo'}
    password_confirmation {password}
  end
end