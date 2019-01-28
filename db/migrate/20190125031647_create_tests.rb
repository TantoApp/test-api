class CreateTests < ActiveRecord::Migration[5.2]
  def change
    create_table :tests do |t|
      t.string :description
      t.integer :test_case_id
      t.integer :status, default: 0
      t.boolean :active, default: true
      
      t.timestamps
    end
  end
end
