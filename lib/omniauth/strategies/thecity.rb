require 'omniauth/strategies/oauth2'

module OmniAuth
  module Strategies
    class TheCity < OmniAuth::Strategies::OAuth2
      DEFAULT_SCOPE = 'user_basic'

      option :name, :thecity

      option :client_options, {
        site: "https://authentication.onthecity.org",
        authorize_path: "/oauth/authorize"
      }

      def request_phase
        redirect client.auth_code.authorize_url({:redirect_uri => callback_url}.merge(authorize_params))
      end

      def authorize_params
         super.tap do |params|
           params[:scope] ||= DEFAULT_SCOPE
         end
      end

      uid do
        raw_info["global_user"]["id"]
      end

      info do
        raw_info
      end

      def raw_info
        if session[:subdomain].present?
          @raw_info ||= access_token.get("/authorization?subdomain=#{session[:subdomain]}").parsed
        else
          @raw_info ||= access_token.get("/authorization").parsed
        end
      end
    end
  end
end

OmniAuth.config.add_camelization 'thecity', 'TheCity'

