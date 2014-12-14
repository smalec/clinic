class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.string :date
      t.references :doctor
      t.references :patient

      t.timestamps
    end
  end
end
