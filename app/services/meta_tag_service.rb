class MetaTagService
  def self.defaults
    {
      site: "Readit",
      image: ActionController::Base.helpers.asset_url('cat.webp'),
      description: "Readit, but BETTER!!!",
      og: {
        title: "Readit",
        image: ActionController::Base.helpers.asset_url('cat.webp'),
        description: "Readit, but BETTER!!!",
        site_name: "Readit"
      },
    }
  end
end
