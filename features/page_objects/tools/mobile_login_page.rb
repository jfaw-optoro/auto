module PageObjects
  module MobileLogin
    class MobileLoginPage < SitePrism::Page
      set_url "/login?mobile=1"
      # elements
      element :username, "#login-page #login"
      element :password, "#login-page #password"
      element :submit, "#login-page input[name='commit']"
      # methods

    end
  end
end

