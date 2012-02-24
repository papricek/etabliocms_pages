# encoding: utf-8
module HelperMethods

  def login_as(user, password = nil)
    password = '123456' if password.nil?
    visit login_page
    page.should have_content('Sign in')
    fill_in 'Email', :with => user.email
    fill_in 'Heslo', :with => password
    click_button('Sign in')
    page.should have_content('Přihlášení proběhlo úspěšně.')
  end

end

RSpec.configuration.include HelperMethods, :type => :acceptance