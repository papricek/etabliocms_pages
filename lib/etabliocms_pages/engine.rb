require 'awesome_nested_set'

module EtabliocmsPages

  class Engine < ::Rails::Engine

    initializer "etabliocms_core.initialize" do |app|
      EtabliocmsCore.setup do |config|
        config.modules ||= []
        config.modules << :pages
      end
    end

    initializer "etabliocms_pages.initialize" do |app|
      EtabliocmsPages.setup do |config|
        config.areas ||= [:text]
      end
    end

  end

end
