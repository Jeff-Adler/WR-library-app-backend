class CreateReferenceDuplicates < ActiveRecord::Migration[6.0]
  def change
    create_table :reference_duplicates do |t|
      t.references :reference, null: false, foreign_key: { to_table: 'books'}
      t.references :duplicate, null: false, foreign_key: { to_table: 'books'}

      t.timestamps
    end
  end
end
