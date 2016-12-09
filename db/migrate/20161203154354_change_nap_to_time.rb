class ChangeNapToTime < ActiveRecord::Migration
  def change
  	change_column(:kids, :nap1, 'time USING bedtime::time without time zone')
  	change_column(:kids, :nap2, 'time USING bedtime::time without time zone')
  	change_column(:kids, :nap3, 'time USING bedtime::time without time zone')
  end
end
