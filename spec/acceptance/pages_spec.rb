# encoding: utf-8
require 'acceptance/acceptance_helper'

feature 'Pages', '' do

  scenario 'Some crud for admin' do
    user = FactoryGirl.create(:user)
    visit "/sign_in"
    page.should have_content('Sign in')
    fill_in 'Email', :with => user.email
    fill_in 'Heslo', :with => '123456'
    click_button('Sign in')
    page.should have_content('Přihlášení proběhlo úspěšně.')
    save_and_open_page
    click_link('Stránky (0)')
    page.should have_content('Stránky')
    click_link('Přidat stránku »')
    click_button('Uložit')
    page.should have_content('Nadpis je povinná položka')
    fill_in 'Nadpis', :with => 'A title with české znaky ěščřžýáíé'
    click_button('Uložit')
    page.should have_content('Stránka byla úspěšně vytvořena.')
    page = EtabliocmsPages::Page.last
    page.title.should == 'A title with české znaky ěščřžýáíé'
    page.slug.should == 'a-title-with-ceske-znaky-escrzyaie'
  end

end
