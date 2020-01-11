# frozen_string_literal: true

class CreateRates < ActiveRecord::Migration[5.2]
  def change
    create_table :rates do |t|
      t.decimal :rate
      t.datetime :force_date

      t.timestamps
    end
  end
end
