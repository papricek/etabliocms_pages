class AddMetaColumns < ActiveRecord::Migration

  def change
    add_column :contents, :meta_title, :string
    add_column :contents, :meta_description, :text
  end

end