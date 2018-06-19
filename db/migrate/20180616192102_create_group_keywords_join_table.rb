class CreateGroupKeywordsJoinTable < ActiveRecord::Migration[5.1]
  def change
    create_table :groups_keywords, id: false do |t|
      t.integer :keyword_id
      t.integer :group_id
    end

    add_index :groups_keywords, :keyword_id
    add_index :groups_keywords, :group_id
  end
end
