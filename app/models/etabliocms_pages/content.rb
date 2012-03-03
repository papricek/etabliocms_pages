module EtabliocmsPages
  class Content < ActiveRecord::Base

    after_initialize :debuggie

    def debuggie
      puts self.inspect
    end
    validates :title, :presence => true
    validates :locale, :presence => true

    belongs_to :page

    serialize :areas, Hash

    has_slug :to_param => "path"

  end
end
