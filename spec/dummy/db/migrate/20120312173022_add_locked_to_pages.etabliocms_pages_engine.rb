# This migration comes from etabliocms_pages_engine (originally 20120312181555)
class AddLockedToPages < ActiveRecord::Migration

  def change
    add_column :pages, :locked, :boolean, :default => false
  end

end