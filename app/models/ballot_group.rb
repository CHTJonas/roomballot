# == Schema Information
#
# Table name: ballot_groups
#
#  id                 :integer          not null, primary key
#  name               :string           not null
#  token              :string           not null
#  position_in_ballot :integer
#  user_id            :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  deleted_at         :datetime
#

class BallotGroup < ApplicationRecord
  belongs_to :owner, class_name: 'User', foreign_key: 'user_id'
  has_many :members, class_name: 'User'
  has_secure_token

  validates :token, uniqueness: true
  validates :position_in_ballot, numericality: {
    only_integer: true,
    allow_nil: true,
    greater_than: 0
  }
  validates :size, numericality: {
    only_integer: true,
    less_than_or_equal_to: 9
  }

  def size
    self.members.count
  end

  # Shuffles all the groups in-place to make a randomly ordered ballot.
  # See https://en.wikipedia.org/wiki/Fisher–Yates_shuffle
  def self.shuffle(seed)
    if ApplicationSetting.instance.shuffle_seed.nil?
      groups = BallotGroup.all.to_a
      start_i = groups.length - 1
      end_i = 1
      prng = Random.new(seed)
      start_i.downto(end_i).each do |i|
        j = prng.rand(0..i)
        groups[i], groups[j] = groups[j], groups[i]
      end
      ActiveRecord::Base.transaction do
        ApplicationSetting.update(shuffle_seed: seed)
        groups.each_with_index do |group, index|
          group.update(position_in_ballot: index + 1)
        end
      end
    else
      raise 'Ballot group shuffle has already been performed.'
    end
  end
end
