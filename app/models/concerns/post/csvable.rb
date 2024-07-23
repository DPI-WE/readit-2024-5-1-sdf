module Post::Csvable
  extend ActiveSupport::Concern

  class_methods do
    def to_csv
      posts = self.all
      site_information = ["Readit", Rails.application.routes.url_helpers.root_url]
      headers = ["id", "title", "body", "author", "url"]
      csv = CSV.generate(headers: true) do |csv|
        csv << site_information
        csv << headers
        posts.each do |post|
          row = []

          row << post.id
          row << post.title
          row << post.body.truncate_words(5)
          row << post.author.email
          row << Rails.application.routes.url_helpers.post_url(post)

          csv << row
        end
      end
      return csv
    end
  end
end
