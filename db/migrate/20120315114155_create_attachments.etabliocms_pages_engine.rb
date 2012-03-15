class CreateAttachments < ActiveRecord::Migration

  def change
    create_table :attachments do |t|
      t.string :title

      t.string :data_file_name
      t.string :data_content_type
      t.integer :data_file_size
      t.datetime :data_updated_at

      t.references :attachable, :polymorphic => {:default => 'Page'}
      t.timestamps
    end
  end

end