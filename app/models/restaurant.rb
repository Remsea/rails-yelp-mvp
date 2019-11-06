
# validation class
class RightCategory < ActiveModel::Validator
  def validate(record)
    if !['chinese', 'italian', 'japanese', 'french', 'belgian'].include?(record.category)
      record.errors[:category] << "Category must be one of ['chinese', 'italian', 'japanese', 'french', 'belgian']"
    end
  end
end

#  class restaurant
class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy
  validates :name, presence: true
  validates :address, presence: true
  validates :category, presence: true

  validates_with RightCategory
end
