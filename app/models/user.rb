# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string
#  email           :string
#  crsid           :string
#  year_group      :integer
#  scholar         :boolean
#  jcr_president   :boolean
#  admin           :boolean
#  blocked         :boolean
#  ballot_group_id :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  deleted_at      :datetime
#

class User < ApplicationRecord
  belongs_to :ballot_group

  # The user's year group category.
  enum year_group: [ :first_year, :second_year, :third_year, :third_year_abroad ]

  # The user's priority in the ballot.
  def ballot_priority
    if self.scholar? || self.jcr_president?
      return 1
    end
    case self.group
    when 'second_year'
      return 2
    when 'third_year_abroad'
      return 2
    when 'third_year'
      return 3
    when 'first_year'
      return 4
    else
      raise 'Unknown group'
    end
  end

  def self.create_with_group(*args)
    u = User.new(*args)
    bg = BallotGroup.new
    bg.name = "#{u.name.possessive} Ballot Group" unless u.name.blank?
    bg.owner = u
    u.ballot_group = bg

    # This will save the user and group in a single transaction.
    u.save
  end

  # Grants site administrator privileges to the user.
  def make_admin!
    self.update(admin: true)
  end

  # Revokes site administrator privileges from the user.
  def revoke_admin!
    self.update(admin: false)
  end

  # Block a user - stops them from logging in.
  def block!
    self.update(blocked: true)
  end

  # Unblock a user.
  def unblock!
    self.update(blocked: false)
  end
end
