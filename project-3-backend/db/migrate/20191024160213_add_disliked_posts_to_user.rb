class AddDislikedPostsToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :disliked_posts, :integer, array: true, default: []
  end
end
