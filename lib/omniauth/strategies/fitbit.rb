require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Fitbit < OmniAuth::Strategies::OAuth2

      option :name, 'fitbit'

      option :client_options, {
        site: 'https://api.fitbit.com',
        authorize_url: 'https://www.fitbit.com/oauth/authorize',
        request_token_path: '/oauth/request_token',
        access_token_path: '/oauth/access_token',
        authorize_path: '/oauth/authorize'
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

OmniAuth.config.add_camelization 'fitbit', 'fitBit'
