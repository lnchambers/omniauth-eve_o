require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class EveO < OmniAuth::Strategies::OAuth2
      option :client_options, {
        site: 'https://login.eveonline.com',
        authorize_url: 'https://login.eveonline.com/oauth/authorize',
        token_url: 'https://login.eveonline.com/oauth/token'
      }

      option :name, 'eve_o'

      uid { raw_info['CharacterID'] }

      info do
        {
          name: raw_info['CharacterName'],
          character_id: raw_info['CharacterID'],
          expires_on: raw_info['ExpiresOn'],
          scopes: raw_info['Scopes'],
          token_type: raw_info['TokenType'],
          character_owner_hash: raw_info['CharacterOwnerHash']
        }
      end

      extra do
        {
          raw_info: raw_info
        }
      end

      def raw_info
        @raw_info ||= access_token.get('/oauth/verify').parsed
      end

      def authorize_params
        super.tap do |params|
          %w[scope].each do |v|
            if request.params[v]
              params[v.to_sym] = request.params[v]
            end
          end

          params[:scope] ||= ''
        end
      end
    end
  end
end
