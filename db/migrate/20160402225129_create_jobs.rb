class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :company
      t.string :city
      t.string :url

      t.timestamps null: false
    end
  end
end
