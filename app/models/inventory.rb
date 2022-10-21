class Inventory < ApplicationRecord
  has_many :groups, dependent: :destroy
  has_many :items, through: :groups
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'

  validates :name, presence: true
  validates :icon, presence: true
end
