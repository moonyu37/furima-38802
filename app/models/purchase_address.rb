class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :sender_area_id, :municipalities, :street_address, :building_name, :phone_number

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :municipalities
    validates :street_address
    validates :phone_number, format: { with: /\A[0-9]{11}\z/, message: 'is invalid' }
  end
    validates :sender_area_id, numericality: { other_than: 1 , message: "can't be blank"}


  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)

  end

end