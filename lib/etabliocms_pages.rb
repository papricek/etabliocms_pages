require "active_support/dependencies"

module EtabliocmsPages

  mattr_accessor :areas

  def self.setup
    yield self
  end

end

require "etabliocms_pages/engine"
require "form_helper"
