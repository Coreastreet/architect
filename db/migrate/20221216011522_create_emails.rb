class CreateEmails < ActiveRecord::Migration[7.0]
  def change
    create_table :emails do |t|
      t.string :email_address
      t.boolean :opt_out

      t.timestamps
    end
  end
end
