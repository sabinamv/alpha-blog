class CreateSmth < ActiveRecord::Migration[7.0]
  def change
    create_table :smths do |t|

      t.timestamps
    end
  end
end
