class CreateBugs < ActiveRecord::Migration[5.2]
  def change
    create_table :bugs do |t|
      t.string :title
      t.string :description
      t.string :state

      t.timestamps
    end
  end
end
