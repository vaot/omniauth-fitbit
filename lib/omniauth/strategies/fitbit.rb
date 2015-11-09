require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Fitbit < OmniAuth::Strategies::OAuth2

      option :name, 'fitbit'

      option :client_options, {
        site: 'https://api.fitbit.com',
        authorize_url: 'https://www.fitbit.com/oauth2/authorize',
        token_url: 'https://api.fitbit.com/oauth2/token',
        profile_path: '/1/user/-/profile.json'
      }

      uid do
        raw_info["user"]["encodedId"]
      end

      info do
        Hash.new.tap do |user|
          user[:full_name]    = raw_info['user']['fullName']
          user[:display_name] = raw_info['user']['displayName']
          user[:avatar_url]   = raw_info['user']['avatar150']
          user[:gender]       = raw_info['user']['gender']
          user[:height]       = raw_info['user']['height']
          user[:weight]       = raw_info['user']['weight']
        end
      end

      extra do
        { raw_info: raw_info }
      end

      def build_access_token
        options.token_params.merge!(:headers => { 'Authorization' => basic_auth_header })
        super
      end

      def raw_info
        @raw_info ||= MultiJson.load(access_token.get(profile_endpoint).body)
      end

      def query_string
        ''
      end

      private

      def profile_endpoint
        "#{options[:client_options][:site]}#{options[:client_options][:profile_path]}"
      end

      def basic_auth_header
        "Basic #{encoded_client_id_and_secret}"
      end

      def encoded_client_id_and_secret
        Base64.strict_encode64("#{options[:client_id]}:#{options[:client_secret]}")
      end
    end
  end
end

OmniAuth.config.add_camelization 'fitbit', 'Fitbit'
