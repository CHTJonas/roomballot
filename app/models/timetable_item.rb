# == Schema Information
#
# Table name: timetable_items
#
#  id          :integer          not null, primary key
#  when        :datetime
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  deleted_at  :datetime
#

class TimetableItem < ApplicationRecord
  validates :when, presence: true
  validates :description, presence: true
end
