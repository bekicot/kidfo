class KidChangeColumnType < ActiveRecord::Migration
  def change
    change_column(:kids, :bedtime, 'time USING bedtime::time without time zone')
  end
end
