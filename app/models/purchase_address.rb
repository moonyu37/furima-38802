class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :sender_area_id, :municipalities, :street_address, :building_name, :phone_number
  attr_accessor :token

  with_options presence: true do
    validates :token
    validates :post_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :municipalities
    validates :street_address
  end
    validates :sender_area_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :phone_number, format: { with: /\A[0-9]{11}\z/, message: 'is invalid' }


  def save
    purchase = Purchase.create!(user_id: user_id, item_id: item_id)
    Address.create!(purchase_id: purchase.id, post_code: post_code, sender_area_id: sender_area_id, municipalities: municipalities, street_address: street_address, building_name: building_name, phone_number: phone_number)
  end

end