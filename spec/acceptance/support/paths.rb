module NavigationHelpers

  def homepage
    "/"
  end

  def admin_homepage
    "/admin"
  end

  def login_page
    "/sign_in"
  end

end

RSpec.configuration.include NavigationHelpers, :type => :acceptance