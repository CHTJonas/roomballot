# == Schema Information
#
# Table name: images
#
#  id            :integer          not null, primary key
#  url           :text
#  description   :text
#  dwelling_type :string
#  dwelling_id   :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  deleted_at    :datetime
#

class Image < ApplicationRecord
  belongs_to :dwelling, polymorphic: true
end
