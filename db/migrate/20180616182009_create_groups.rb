class CreateGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :groups do |t|
      t.integer :website_id
      t.string :name

      t.belongs_to :campaign, index: true
      t.timestamps
    end
  end
end
