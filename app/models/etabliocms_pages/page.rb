module EtabliocmsPages
  class Page < ActiveRecord::Base

    acts_as_nested_set
    attr_accessor :child_of
    after_save :update_position

    has_many :contents, :class_name => "EtabliocmsPages::Content", :inverse_of => :page, :order => "locale asc", :dependent => :destroy
    accepts_nested_attributes_for :contents, :reject_if => proc { |attributes| attributes['title'].blank? }

    validate :at_least_one_content_has_title

    def path
      self_and_ancestors.map(&:slug).join("/")
    end

    def title
      contents.map(&:title).join(" / ")
    end

    def locale
      contents.map(&:locale).join(", ")
    end

    def other_pages_for_select
      pages = EtabliocmsPages::Page.order("lft ASC")
      pages = pages.where("id != ?", id) unless new_record?
      pages.map { |d| [d.title, d.id] }
    end

    def build_contents_for_available_locales
      I18n.available_locales.each do |available_locale|
        contents.build(:locale => available_locale) unless contents.detect { |c| c.locale == available_locale.to_s }
      end
    end

    scope :visible, where(:visible => true)

    private
    def update_position
      if child_of.to_i != parent_id.to_i
        if child_of.present?
          parent = Page.find(child_of)
          move_to_child_of parent unless parent == self or parent == self.parent
          move_to_bottom
        elsif !child_of.nil?
          move_to_root
          move_to_bottom
        end
      end
      self.child_of = nil
    end

    def at_least_one_content_has_title
      if contents.select { |c| c.title.present? }.blank?
        errors[:base] << I18n.t('activerecord.errors.messages.at_least_one_content_has_title')
      end
    end

  end

end
