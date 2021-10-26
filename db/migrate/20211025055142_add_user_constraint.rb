class AddUserConstraint < ActiveRecord::Migration[6.1]
  def self.up
    execute "ALTER TABLE users ADD CONSTRAINT check_gender_constraint CHECK \
    (gender IN ('Male', 'Female', 'Transgender'))"
  end

  def self.down
    execute 'ALTER TABLE users DROP check_gender_constraint'
  end
end
