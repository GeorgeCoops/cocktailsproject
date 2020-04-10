class CreateGarnishes < ActiveRecord::Migration[6.0]
  def change
    create_table :garnishes do |t|
      t.string :name
      t.boolean :edible

      t.timestamps
    end
  end
end
