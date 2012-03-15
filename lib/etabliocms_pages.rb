require "active_support/dependencies"

module EtabliocmsPages

  mattr_accessor :areas
  mattr_accessor :paperclip_large
  mattr_accessor :paperclip_medium
  mattr_accessor :paperclip_thumbnail

  def self.setup
    yield self
  end

end

require "etabliocms_pages/engine"
require "form_helper"
