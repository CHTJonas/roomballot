# == Schema Information
#
# Table name: ballot_groups
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  token      :string           not null
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  deleted_at :datetime
#

class BallotGroup < ApplicationRecord
  belongs_to :owner, class_name: 'User', foreign_key: 'user_id'
  has_many :members, class_name: 'User'
  has_secure_token
end
