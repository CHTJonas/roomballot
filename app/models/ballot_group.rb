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

  validates :size, numericality: {
    greater_than_or_equal_to: 1,
    less_than_or_equal_to: 9
  }

  def size
    self.members.count
  end

  # Shuffles all the groups in-place to make a randomly ordered ballot.
  # See https://en.wikipedia.org/wiki/Fisher–Yates_shuffle
  def self.shuffle(seed)
    groups = BallotGroup.all.to_a
    start_i = groups.length - 1
    end_i = 1
    prng = Random.new(seed)
    (start_i..end_i).each do |i|
      j = prng.rand(0..i)
      groups[i], groups[j] = groups[j], groups[i]
    end
    ActiveRecord::Base.transaction do
      groups.each_with_index do |group, index|
        group.update(ballot_position: index + 1)
      end
    end
  end
end
