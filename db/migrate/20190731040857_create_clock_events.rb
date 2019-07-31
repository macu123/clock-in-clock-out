class CreateClockEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :clock_events do |t|
      t.datetime :checkin_at
      t.datetime :checkout_at
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
