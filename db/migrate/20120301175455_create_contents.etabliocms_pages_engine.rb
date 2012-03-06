class CreateContents < ActiveRecord::Migration

def change
    create_table :contents do |t|
      t.string :title, :null => false
      t.string :slug, :null => false

      t.text :areas
      t.string :locale, :null => false
      t.integer :page_id, :null => false
      t.timestamps
    end

    EtabliocmsPages::Page.all.each do |page|
      page.contents.create!(:title => page.read_attribute('title'),
                           :slug => page.read_attribute('slug'),
                           :locale => page.read_attribute('locale'),
                           :areas => {:text => page.read_attribute('text'), :sidebar => page.read_attribute('sidebar')})
    end
    remove_column :pages, :title
    remove_column :pages, :slug
    remove_column :pages, :locale
    remove_column :pages, :text
  end

end
