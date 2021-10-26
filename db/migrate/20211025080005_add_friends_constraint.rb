class AddFriendsConstraint < ActiveRecord::Migration[6.1]
  def self.up
    execute "ALTER TABLE friends ADD CONSTRAINT check_status_constraint CHECK \
    (status IN ('accepted','reject','sent','pending','follower'))"
  end

  def self.down
    execute 'ALTER TABLE friends DROP CONSTRAINT check_status_constraint'
  end
end
