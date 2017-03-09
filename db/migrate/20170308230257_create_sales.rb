class CreateSales < ActiveRecord::Migration[5.0]
  def change
    create_table :sales do |t|
          t.string :business_name
          t.string :website
          t.string :location
          t.string :sale

      end
    end
end
