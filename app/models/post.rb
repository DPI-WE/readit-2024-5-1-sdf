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
#  author_id    :bigint
#
# Indexes
#
#  index_posts_on_author_id  (author_id)
#
# Foreign Keys
#
#  fk_rails_...  (author_id => users.id)
#
class Post < ApplicationRecord
  belongs_to :author, class_name: "User"

  scope :published, -> { where("published_at <= ?", Time.current) }
  scope :unpublished, -> { where("published_at > ?", Time.current).or(where(published_at: nil)) }

  def published?
    self.published_at.present? && self.published_at <= Time.current
  end

  def unpublished?
    self.published_at.nil? || self.published_at > Time.current
  end

  def to_s
    "#{id}-#{title}"
  end
end
