class CreateFooterSlidesFooterSlides < ActiveRecord::Migration

  def up
    create_table :refinery_footer_slides do |t|
      t.string :title
      t.text :description
      t.integer :image_id
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-footer_slides"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/footer_slides/footer_slides"})
    end

    drop_table :refinery_footer_slides

  end

end
