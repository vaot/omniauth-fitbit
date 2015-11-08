require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Fitbit < OmniAuth::Strategies::OAuth2

      option :name, 'fitbit'

      option :client_options, {
        site: 'https://api.fitbit.com'
        authorize_url: 'https://www.fitbit.com/oauth2/authorize',
        token_url: 'https://api.fitbit.com/oauth2/token'
      }


      uid do
        binding.pry
      end

      info do
        binding.pry
      end


      def raw_info
        binding.pry
      end
    end
  end
end

OmniAuth.config.add_camelization 'fitbit', 'FitBit'
