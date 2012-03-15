module EtabliocmsPages
  class Attachment < ActiveRecord::Base

    belongs_to :attachable, :polymorphic => true

    has_attached_file :data,
                      :styles => {
                        :large => EtabliocmsPages.try(:paperclip_large) || "800x800>",
                        :medium => EtabliocmsPages.try(:paperclip_medium) || "400x400>",
                        :thumbnail => EtabliocmsPages.try(:paperclip_thumbnail) || "100x100>"}

    validates_attachment_presence :data

  end
end
