class User < ApplicationRecord
  has_many :items
  has_many :inventories

  validates :name, presence: true
end
