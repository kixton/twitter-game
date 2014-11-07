class ChangeUidColumnToUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
    t.rename :google_uid, :twitter_uid
    end
  end
end

#db not migrated yet