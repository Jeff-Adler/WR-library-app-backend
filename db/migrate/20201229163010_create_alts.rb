class CreateAlts < ActiveRecord::Migration[6.0]
  def change
    create_table :alts do |t|
      t.string :title, null: false
      t.references :book, null: false, foreign_key: true

      t.timestamps
    end
  end
end
