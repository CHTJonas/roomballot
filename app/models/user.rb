# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string
#  email           :string
#  crsid           :string
#  category        :integer
#  admin           :boolean
#  blocked         :boolean
#  ballot_group_id :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  deleted_at      :datetime
#

class User < ApplicationRecord
  belongs_to :ballot_group

  # The user's category, which very roughly equates to their priority in
  # the ballot.
  enum category: [ :second_year_scholar, :third_year_scholar,
    :third_year_scholar_abroad, :second_year, :third_year_abroad,
    :third_year, :first_year ]

  # The user's actual priority in the ballot.
  def ballot_priority
    case self.group
    when 'second_year_scholar'
      return 1
    when 'third_year_scholar'
      return 3
    when 'third_year_scholar_abroad'
      return 2
    when 'second_year'
      return 1
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
    self.admin = true
  end

  # Revokes site administrator privileges from the user.
  def revoke_admin!
    self.admin = false
  end

  # Block a user - stops them from logging in.
  def block!
    self.blocked = true
  end

  # Unblock a user.
  def unblock!
    self.blocked = false
  end
end
