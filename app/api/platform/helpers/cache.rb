module Platform
  module Helpers
    module Cache
      def default_cache_race_ttl
        10
      end

      def cache_config
        { expires_in: 1.week, race_condition_ttl: default_cache_race_ttl }
      end

      # cache the result of the block using the specified key
      def cache(key, &block)
        fail "Block required!" unless block_given?
        Rails.cache.fetch(key, cache_config, &block)
      end
    end
  end
end