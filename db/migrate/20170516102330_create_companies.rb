class CreateCompanies < ActiveRecord::Migration[5.0]
  def change
    create_table :companies do |t|
      t.string  :name,           null: false
      t.string  :company_tel,    null: false
      t.string  :company_email,  null: false
      t.string  :region_id
      t.integer :prefecture_id,  null: false
      t.string  :address1,       null: false
      t.string  :address2

      t.timestamps
    end
  end
end
