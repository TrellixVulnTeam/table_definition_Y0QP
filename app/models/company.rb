# == Schema Information
#
# Table name: companies
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Company < ApplicationRecord
  has_many :users
  has_many :projects
  belongs_to :prefecture

  accepts_nested_attributes_for :users

  validates :name, presence: true
end
