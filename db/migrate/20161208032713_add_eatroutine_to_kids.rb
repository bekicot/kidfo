class AddEatroutineToKids < ActiveRecord::Migration
  def change
  	add_column :kids, :breakfasttime, :time
	add_column :kids, :breakfastdetails, :text
	add_column :kids, :snack1time, :time
	add_column :kids, :snack1details, :text
	add_column :kids, :lunchtime, :time
	add_column :kids, :lunchdetails, :text
	add_column :kids, :snack2time, :time
	add_column :kids, :snack2details, :text
	add_column :kids, :dinnertime, :time
	add_column :kids, :dinnerdetails, :text
	add_column :kids, :afterdinnertime, :time
	add_column :kids, :afterdinnerdetails, :text
  end
end
