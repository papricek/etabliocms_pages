module EtabliocmsPages

  class Engine < ::Rails::Engine

    initializer "etabliocms_core.initialize" do |app|
      EtabliocmsCore.setup do |config|
        config.modules << :pages
      end
    end

  end

end
