class AddDeviceUserOnEmails < ActiveRecord::Migration[7.0]
  def change
    add_reference :emails, :device_user, index: true
  end
end
