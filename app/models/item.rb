class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_burden
  belongs_to :sender_area
  belongs_to :shipping_day


  #空の投稿を保存できないようにする
  validates :image, presence: true
  validates :item_name, presence: true
  validates :explanation, presence: true
  with_options presence: true,format: { with: /\A[0-9]+\z/ } do
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
                    presence: { message: "can't be blank"}
  end
  with_options numericality: { other_than: 1 , message: "can't be blank"} do
    validates :category_id
    validates :condition_id
    validates :shipping_burden_id
    validates :sender_area_id
    validates :shipping_day_id
  end

end
