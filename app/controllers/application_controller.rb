class ApplicationController < ActionController::Base

    helper_method :logged_in_as_creator?
    helper_method :current_creator
    helper_method :authenticate
    helper_method :render_flash

    # helper_method :current_auth_token
    # helper_method :require_guest_uuid

    def logged_in_as_creator?
        !!current_creator
    end

    def current_creator
        # Look up the current student based on user_id in the session cookie:
        @current_creator ||= Creator.find(decoded_auth_token[:creator_id]) if decoded_auth_token
    end

    def decoded_auth_token
        @decoded_auth_token ||= JsonWebToken.decode(http_auth_cookie)
    end

    def http_auth_cookie
        if cookies[:auth_token].present?
            logger.debug("Cookies present")
            return cookies[:auth_token]
        else
            logger.debug 'Missing token'
        end
    end

    def authenticate
        if !logged_in_as_creator?
            # cookies[:referer] = { value: request.url, domain: ".#{Notebank::DOMAIN}" }
            redirect_to admin_login_url
        end
    end
end
