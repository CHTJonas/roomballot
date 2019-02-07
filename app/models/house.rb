# == Schema Information
#
# Table name: houses
#
#  id          :integer          not null, primary key
#  name        :string
#  size        :string
#  price       :string
#  information :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  deleted_at  :datetime
#

class House < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :images, as: :dwelling, dependent: :destroy
  validates :name, presence: true
end
