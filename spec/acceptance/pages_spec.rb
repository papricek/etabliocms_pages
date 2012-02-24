# encoding: utf-8
require 'acceptance/acceptance_helper'

feature 'Pages', '' do

  background do
    user = FactoryGirl.create(:user)
    login_as(user)
  end

  scenario 'Some crud for admin' do
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

  scenario 'Moving pages in hierarchy via edit' do
    root = FactoryGirl.create(:page)
    first_child = FactoryGirl.create(:page, :child_of => root.id)
    second_child = FactoryGirl.create(:page, :child_of => root.id)
    first_child.parent.should == root
    second_child.parent.should == root
    visit admin_homepage
    click_link('Stránky (3)')
    click_link(first_child.title)
    page.should have_content(first_child.title)
    select 'Nejvyšší úroveň', :from => 'Rodič'
    click_button('Uložit')
    page.should have_content('Stránka byla úspěšně upravena.')
    first_child.reload.parent.should be_nil
    click_link(first_child.title)
    select root.title, :from => 'Rodič'
    click_button('Uložit')
    page.should have_content('Stránka byla úspěšně upravena.')
    first_child.reload.parent.should == root
  end

  scenario 'Moving pages in hierarchy via arrows' do
    root = FactoryGirl.create(:page)
    first_child = FactoryGirl.create(:page, :child_of => root.id)
    second_child = FactoryGirl.create(:page, :child_of => root.id)
    root.children.first.should == first_child
    visit admin_homepage
    click_link('Stránky (3)')
    find(:xpath, "//a[@href='/admin/pages/#{first_child.id}/move?method=move_lower']").click
    page.should have_content('Stránka byla úspěšně přesunuta.')
    root.children.reload.first.should == second_child
    page.driver.put("/admin/pages/#{first_child.id}/move?method=move_to_bottom")
    root.children.reload.first.should == second_child
    find(:xpath, "//a[@href='/admin/pages/#{second_child.id}/move?method=move_to_bottom']").click
    page.should have_content('Stránka byla úspěšně přesunuta.')
    root.children.reload.first.should == first_child
  end

end
