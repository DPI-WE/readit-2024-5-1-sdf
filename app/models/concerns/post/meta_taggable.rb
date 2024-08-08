module Post::MetaTaggable
  extend ActiveSupport::Concern

  def to_meta_tags
    # TODO: add author avatar image
    MetaTagService.defaults.deep_merge({
      title: title,
      description: body.truncate_words(20)
    })
  end
end
