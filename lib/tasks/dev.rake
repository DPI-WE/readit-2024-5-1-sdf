unless Rails.env.production?
  namespace :dev do
    desc "Drop, create, migrate, and seed database"
    task reset: [
      :environment,
      "db:drop",
      "db:create",
      "db:migrate",
      "db:seed",
      "dev:sample_data"] do
      puts "Reset environment"
    end

    desc "Add sample data"
    task sample_data: :environment do
      puts "Creating 100 posts"
      100.times do |i|
        Post.create(
          title: Faker::Movies::PrincessBride.character,
          body: Faker::Movies::PrincessBride.quote,
          published_at: i.even? ? Time.current : nil
        )
      end
    end

  end
end
