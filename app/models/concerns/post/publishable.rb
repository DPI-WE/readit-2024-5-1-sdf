module Post::Publishable
  extend ActiveSupport::Concern

  included do
    scope :published, -> { where("published_at <= ?", Time.current) }
    scope :unpublished, -> { where("published_at > ?", Time.current).or(where(published_at: nil)) }
  end

  def published?
    self.published_at.present? && self.published_at <= Time.current
  end

  def unpublished?
    self.published_at.nil? || self.published_at > Time.current
  end
end
