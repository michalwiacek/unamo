class CreatePositions < ActiveRecord::Migration[5.1]
  def change
    create_table :positions do |t|
      t.string :date
      t.integer :occurrences

      t.belongs_to :keyword, index: true
    end
  end
end
