class AddLocationInfoToInquiries < ActiveRecord::Migration
  def change
    add_column :refinery_inquiries_inquiries, :address, :string
    add_column :refinery_inquiries_inquiries, :city, :string
    add_column :refinery_inquiries_inquiries, :state, :string
    add_column :refinery_inquiries_inquiries, :zip, :string
    add_column :refinery_inquiries_inquiries, :call_time, :string
  end
end
