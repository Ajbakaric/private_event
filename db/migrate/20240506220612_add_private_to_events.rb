# db/migrate/xxxxxxxxxx_add_private_to_events.rb
class AddPrivateToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :private, :boolean, default: false
  end
end
