class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.string :content
      t.integer :rating
      t.references :costume, null: false, foreign_key: true

      t.timestamps
    end
  end
end
