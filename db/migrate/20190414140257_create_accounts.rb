class CreateAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :accounts do |t|
      t.references  :accountable, polymorphic: true
      t.string      :source_db
      t.string      :status
      t.timestamps
    end
  end
end
