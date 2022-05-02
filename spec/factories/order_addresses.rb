FactoryBot.define do
  factory :order_address do
    postal_code         {'123-4567'}
    prefecture_id       {2}
    city                {'東京都'}
    block               {'千代田区'}
    building            {'newタウンビル'}
    phone_number        {'1234567890'}

  end
end
