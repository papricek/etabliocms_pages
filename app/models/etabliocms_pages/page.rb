module EtabliocmsPages
  class Page < ActiveRecord::Base

    acts_as_nested_set
    attr_accessor :child_of
    after_save :update_position

    validates :title, :presence => true
    validates :locale, :presence => true

    has_slug :to_param => "path"

    def path
      self_and_ancestors.map(&:slug).join("/")
    end

    def other_pages_for_select
      pages = EtabliocmsPages::Page.order("lft ASC")
      pages = pages.where("id != ?", id) unless new_record?
      pages.map { |d| [d.title, d.id] }
    end

    scope :for_locale, lambda { |locale| where(:locale => locale) }
    scope :visible, where(:visible => true)

    private
    def update_position
      if child_of.present? and child_of != parent_id
        parent = Page.find(child_of)
        move_to_child_of parent unless parent == self or parent == self.parent
        move_to_bottom
      elsif !child_of.nil?
        move_to_root
        move_to_bottom
      end
      self.child_of = nil
    end

  end

end
