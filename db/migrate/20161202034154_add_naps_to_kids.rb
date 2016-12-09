class AddNapsToKids < ActiveRecord::Migration
  def change
  	add_column :kids, :nap1, :string
    add_column :kids, :nap2, :string
    add_column :kids, :nap3, :string
    add_column :kids, :naproutine, :text
  end
end
