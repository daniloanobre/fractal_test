# frozen_string_literal: true

module AuthorsHelper
  def fetch_authors
    authors = $redis.get("authors")

    if authors.nil?
      authors = Author.all.to_json
      $redis.set("authors", authors)
      # Expire the cache, every 5 hours
      $redis.expire("authors", 5.hour.to_i)
    end
    @authors = JSON.load authors
  end
end
