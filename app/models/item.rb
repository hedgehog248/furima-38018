class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  has_one    :order
  has_many_attached :images
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_fee_payer
  belongs_to :area
  belongs_to :days_to_ship

  validates :images, presence: true
  validates :name, presence: true
  validates :explanation, presence: true
  validates :price, presence: true,
                    numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than: 10_000_000 }
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }, presence: true
  validates :condition_id, numericality: { other_than: 1, message: "can't be blank" }, presence: true
  validates :delivery_fee_payer_id, numericality: { other_than: 1, message: "can't be blank" }, presence: true
  validates :area_id, numericality: { other_than: 1, message: "can't be blank" }, presence: true
  validates :days_to_ship_id, numericality: { other_than: 1, message: "can't be blank" }, presence: true
end
