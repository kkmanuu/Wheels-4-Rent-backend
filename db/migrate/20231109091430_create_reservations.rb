class CreateReservations < ActiveRecord::Migration[7.1]
  def change
    create_table :reservations do |t|
      t.date :start_date
      t.date :end_date
      t.string :city
      t.integer :days, default: 0
      t.references :user, null: false, foreign_key: true
      t.references :car, null:false, foreign_key: true

      t.timestamps
    end
  end
end
