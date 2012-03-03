require 'ffaker'

FactoryGirl.define do

  sequence :title do |n|
    Faker::Lorem.sentence(3)
  end

  sequence :email do |n|
    name = [Faker::Name.first_name, Faker::Name.last_name].map { |i| i.gsub(/\W/, '') }.join(".").downcase
    "#{name}#{n}@#{Faker::Internet.domain_name}"
  end

  factory :user, :class => 'EtabliocmsCore::User' do
    email
    password "123456"
    password_confirmation "123456"
  end

  factory :page, :class => 'EtabliocmsPages::Page' do
    contents { [FactoryGirl.build(:content)] }
  end

  factory :content, :class => 'EtabliocmsPages::Content' do
    title
    locale "cs"
    areas :text => Faker::Lorem.paragraphs.to_s
  end

end
