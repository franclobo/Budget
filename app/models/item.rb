class Item < ApplicationRecord
  has_many :groups, dependent: :destroy
  has_many :inventories, through: :groups
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'

  validates :name, presence: true
  validates :amount, presence: true
end
