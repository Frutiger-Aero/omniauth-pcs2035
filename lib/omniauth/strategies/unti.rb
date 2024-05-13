require 'omniauth/strategies/oauth2'

module OmniAuth
  module Strategies
    class Unti < OAuth2
      DEFAULT_SCOPE = ''
      option :name, 'unti'

      option :client_options, {
        :site          => 'https://sso.2035.university/',
        :token_url     => 'https://sso.2035.university/oauth2/access_token',
        :authorize_url => 'https://sso.2035.university/oauth2/authorize'
      }

      option :callback_url

      def request_phase
        super
      end

      def callback_url
        options.callback_url || super
      end

      def build_access_token
        options.token_params.merge!(headers: {
          'content-type' => 'application/x-www-form-urlencoded'
        })

        super
      end

      def authorize_params
        super.tap do |params|
          %w[code state].each do |v|
            if request.params[v]
              params[v.to_sym] = request.params[v]

              # to support omniauth-oauth2's auto csrf protection
              session['omniauth.state'] = params[:state] if v == 'state'
            end
          end

          params[:scope] ||= DEFAULT_SCOPE
        end
      end

      uid { raw_info['leader_id'] }

      info do
        {
          nickname: raw_info['username'],
          email: raw_info['email'],
          name: [raw_info['firstname'], raw_info['secondname']].join(' '),
          token: raw_info['token'],
          leader_id: raw_info['leader_id'],
          unti_id: raw_info['unti_id']
        }
      end

      def raw_info
        @raw_info ||= access_token.get('https://sso.2035.university/users/me').parsed
      end
    end
  end
end
