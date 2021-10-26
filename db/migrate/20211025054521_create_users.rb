class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :middle_name
      t.string :gender
      t.date :date_of_birth
      t.string :relationship
      t.string :bio
      t.string :emails
      t.string :mobile_numbers
      t.string :language

      t.timestamps
    end
  end
end
