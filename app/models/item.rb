class Item < ApplicationRecord
  has_many :classes, dependent: :destroy
  has_many :inventories, through: :classes
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'

  validates :name, presence: true
  validates :amount, presence: true
end
