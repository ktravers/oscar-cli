class CreateNominees < ActiveRecord::Migration
  def change
    create_table :nominees do |t|
      t.string :name
      t.string :attribute
      t.string :vote
      s.belongs_to :category, index: true
    end
  end
end