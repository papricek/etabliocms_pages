module EtabliocmsPages
  class Content < ActiveRecord::Base

    validates :title, :presence => true
    validates :locale, :presence => true

    belongs_to :page, :inverse_of => :contents

    serialize :areas, Hash

    has_slug :to_param => "path"

  end
end
