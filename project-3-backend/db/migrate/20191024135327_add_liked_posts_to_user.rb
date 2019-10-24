class AddLikedPostsToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :liked_posts, :integer, array: true, default: []
  end
end
