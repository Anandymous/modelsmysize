class CreateMeasurements < ActiveRecord::Migration[5.1]
  def change
    create_table :measurements do |t|
      t.string :shirt_size
      t.integer :pant_size
      t.integer :shoe_size
      t.string :instagram_link
      t.string :image_link

      t.timestamps
    end
  end
end
