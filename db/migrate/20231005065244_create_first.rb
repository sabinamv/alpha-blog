class CreateFirst < ActiveRecord::Migration[7.0]
  def change
    create_table :firsts do |t|

      t.timestamps
    end
  end
end
