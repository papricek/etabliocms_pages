class AddLockedToPages < ActiveRecord::Migration

  def change
    add_column :pages, :locked, :boolean, :default => false
  end

end