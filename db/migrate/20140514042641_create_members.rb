class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
