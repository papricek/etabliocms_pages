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
      page.contents.create(:title => page.title,
                           :slug => page.slug,
                           :locale => page.locale,
                           :areas => {:text => page.text})
    end
    remove_column :pages, :title
    remove_column :pages, :slug
    remove_column :pages, :locale
    remove_column :pages, :text
  end

end
