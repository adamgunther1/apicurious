class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :uid
      t.string :username
      t.string :token
      t.string :provider 
      t.string :image_url
      t.integer :num_of_repos
      t.integer :num_of_followers
      t.integer :num_following

      t.timestamps
    end
  end
end
