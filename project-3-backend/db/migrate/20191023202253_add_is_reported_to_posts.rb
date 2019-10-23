class AddIsReportedToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :is_reported, :boolean
  end
end
