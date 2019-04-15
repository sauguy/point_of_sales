# frozen_string_literal: true

class CreateDealerPos < ActiveRecord::Migration[5.2]
  def change
    create_table :dealer_pos do |t|
      t.string      :name
      t.string      :street
      t.string      :city
      t.string      :zip_code
      t.string      :country
      t.string      :state
      t.string      :phone
      t.float      :latitude
      t.float      :longitude
      t.timestamps
    end
  end
end
