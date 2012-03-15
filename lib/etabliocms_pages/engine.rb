require 'awesome_nested_set'
require 'paperclip'

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
      Rails.application.config.assets.precompile += %w( admin-pages.js admin-pages.css )
    end

    initializer "etabliocms_pages.uploadify_middlerware" do |app|
      app.config.middleware.insert_before(
        ActionDispatch::Session::CookieStore,
        FlashSessionCookieMiddleware,
        Rails.application.config.session_options[:key]
      )
    end

    initializer "etabliocms_pages.load_static_assets" do |app|
      app.middleware.use ::ActionDispatch::Static, "#{root}/public"
    end

  end

end
