module Post::MetaTaggable
  extend ActiveSupport::Concern

  def to_meta_tags
    MetaTagService.defaults.deep_merge({
      title: title,
      description: body.truncate_words(20),
      image: image_path,
      og: {
        title: title,
        image: image_path,
        description: body.truncate_words(20),
      }
    })
  end

  def image_path
    if author.avatar.attached?
      Rails.application.routes.url_helpers.rails_blob_path(author.avatar)
    else
      ActionController::Base.helpers.asset_url('default_avatar.png')
    end
  end
end
