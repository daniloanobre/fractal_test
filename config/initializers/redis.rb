# frozen_string_literal: true

# Set up a connection to Redis for manual caching
$redis = Redis::Namespace.new("fractal_test", redis: Redis.new(host: ENV["REDIS_HOST"], port: ENV["REDIS_PORT"]))
