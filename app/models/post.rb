# == Schema Information
#
# Table name: posts
#
#  id           :bigint           not null, primary key
#  body         :text
#  published_at :datetime
#  title        :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Post < ApplicationRecord
  scope :published, -> { where("published_at <= ?", Time.current) }
  scope :unpublished, -> { where("published_at > ?", Time.current).or(where(published_at: nil)) }

  def published?
    self.published_at.present? && self.published_at <= Time.current
  end

  def unpublished?
    self.published_at.nil? || self.published_at > Time.current
  end
end
