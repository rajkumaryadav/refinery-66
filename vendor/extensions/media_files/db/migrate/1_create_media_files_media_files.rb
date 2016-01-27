class CreateMediaFilesMediaFiles < ActiveRecord::Migration

  def up
    create_table :refinery_media_files do |t|
      t.string :title
      t.text :description
      t.string :video_url
      t.boolean :media_type
      t.integer :audio1_id
      t.integer :audio2_id
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-media_files"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/media_files/media_files"})
    end

    drop_table :refinery_media_files

  end

end
