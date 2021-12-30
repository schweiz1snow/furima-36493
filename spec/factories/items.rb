FactoryBot.define do
  factory :item do
    item_name              {'山'}
    explain                {'アルプス'}
    category_id            {'2'}
    condition_id           {'2'}
    payer_id               {'2'}
    prefecture_id          {'47'}
    shipping_day_id        {'4'}
    price                  {'10000'}
  end
end
