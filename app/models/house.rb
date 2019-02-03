# == Schema Information
#
# Table name: houses
#
#  id                :integer          not null, primary key
#  name              :string
#  size              :string
#  price             :string
#  information       :text
#  images            :string
#  imageDescriptions :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  deleted_at        :datetime
#

class House < ApplicationRecord
  has_many :reviews, dependent: :destroy
  validates :name, presence: true
end
