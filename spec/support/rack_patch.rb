module Rack
  module Test
    module Methods
      module Patch
        extend Forwardable
        def_delegators :current_session, *[:patch]
      end
    end
  end
end

module Rack
  module Test
    class Session
      def patch(uri, params = {}, env = {}, &block)
        env = env_for(uri, env.merge(:method => "PATCH", :params => params))
        process_request(uri, env, &block)
      end
    end
  end
end
