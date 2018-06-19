class CreateKeywords < ActiveRecord::Migration[5.1]
  def change
    create_table :keywords do |t|
      t.integer :group_id
      t.integer :website_id
      t.string :name
      
      t.belongs_to :campaign, index: true
      t.timestamps
    end
  end
end
