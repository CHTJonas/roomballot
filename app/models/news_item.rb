# == Schema Information
#
# Table name: news_items
#
#  id         :integer          not null, primary key
#  heading    :string
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  deleted_at :datetime
#

class NewsItem < ApplicationRecord
  validates :heading, presence: true
  validates :content, presence: true
end
