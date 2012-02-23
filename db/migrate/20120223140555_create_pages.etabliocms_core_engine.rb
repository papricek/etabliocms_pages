class CreatePages < ActiveRecord::Migration

  def change
    create_table :pages do |t|
      t.string :title, :null => false
      t.string :slug, :null => false
      t.text :text
      t.string :url

      t.integer :lft
      t.integer :rgt
      t.integer :parent_id

      t.boolean :visible
      t.string :locale, :null => false


      t.timestamps
    end

  end

end

