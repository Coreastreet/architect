class CreateDeviceUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :device_users do |t|
      t.string :browser
      t.string :device_model

      t.timestamps
    end
  end
end
