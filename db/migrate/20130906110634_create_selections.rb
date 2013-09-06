class CreateSelections < ActiveRecord::Migration
  def change
    create_table :selections do |t|
      t.belongs_to :user
      t.belongs_to :choice
    end
  end
end
