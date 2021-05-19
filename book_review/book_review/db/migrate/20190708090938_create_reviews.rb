class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :book_id, forein_key: true
      t.text :content
      t.decimal :points

      t.timestamps
    end
  end
end
