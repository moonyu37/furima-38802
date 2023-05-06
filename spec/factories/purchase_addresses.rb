FactoryBot.define do
  factory :purchase_address do

    post_code      { '111-1111' }
    sender_area_id   { 2 }
    municipalities   {'横浜市緑区'}
    street_address   {'青山1-1-1'}
    building_name    {'柳ビル101'}
    phone_number     { '09000000000' }
    token {"tok_abcdefghijk00000000000000000"}

  end
end
