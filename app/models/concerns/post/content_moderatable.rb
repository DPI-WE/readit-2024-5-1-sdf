module Post::ContentModeratable
  extend ActiveSupport::Concern

  included do
    validate :permissible_content
  end

  private

  def permissible_content
    body_moderation_service = ContentModerationService.new(body).call
    if body_moderation_service.flagged?
      body_moderation_service.reasons.each do |reason|
        errors.add(:body, reason)
      end
    end

    title_moderation_service = ContentModerationService.new(title).call
    if title_moderation_service.flagged?
      title_moderation_service.reasons.each do |reason|
        errors.add(:title, reason)
      end
    end
  end
end
