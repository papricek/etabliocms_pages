# This migration comes from etabliocms_pages_engine (originally 20120415162855)
class AddMetaColumns < ActiveRecord::Migration

  def change
    add_column :contents, :meta_title, :string
    add_column :contents, :meta_description, :text
  end

end