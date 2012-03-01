require 'awesome_nested_set'

module EtabliocmsPages

  class Engine < ::Rails::Engine

    initializer "etabliocms_core.initialize" do |app|
      EtabliocmsCore.setup do |config|
        config.modules ||= []
        config.modules << :pages
      end
    end

  end

end
