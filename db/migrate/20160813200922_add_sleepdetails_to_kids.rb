class AddSleepdetailsToKids < ActiveRecord::Migration
  def change
    add_column :kids, :sleepdetails, :text
  end
end
