class AddTimestampsToArticles < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :created_at, :datetime
    add_column :articles, :updated_at, :datetime
    #drop_table :articles
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
