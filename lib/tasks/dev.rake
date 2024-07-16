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
    task sample_data: [
      :environment,
      "dev:sample_users",
      "dev:sample_posts",
      "dev:sample_comments"
    ]

    desc "Add sample users"
    task sample_users: :environment do
      puts "Creating 100 users"
      100.times do |i|
        User.create(
          email: "#{Faker::Name.first_name.downcase}@example.com",
          password: "password"
        )
      end
    end

    desc "Add sample posts"
    task sample_posts: :environment do
      puts "Creating 100 posts"
      100.times do |i|
        Post.create(
          title: Faker::Movies::PrincessBride.character,
          body: Faker::Movies::PrincessBride.quote,
          published_at: i.even? ? Time.current : nil,
          author: User.all.sample
        )
      end
    end

    desc "Add sample comments"
    task sample_comments: :environment do
      puts "Creating comments for each post"
      Post.all.each do |post|
        rand(1..5).times do |i|
          post.comments.create(
            body: Faker::Hacker.say_something_smart,
            author: User.all.sample
          )
        end
      end
    end

  end
end
