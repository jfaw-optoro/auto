module PageObjects
  module Login
    class LoginPage < SitePrism::Page
      set_url "/login"
      # elements
      element :username, "#login-page #login"
      element :password, "#login-page #password"
      element :submit, "#login-page input[name='commit']"
      # methods
      def click_login
        submit.click
      end
    end
  end
end

