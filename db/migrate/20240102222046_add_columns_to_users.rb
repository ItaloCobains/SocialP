class AddColumnsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :photo, :string, length: { maximum: 255 }, null: true
    add_column :users, :phone, :string, length: { maximum: 15 }, null: true
    add_column :users, :cpf_or_cnpj, :string, length: { maximum: 14 }, uniqueness: true, null: true
  end
end
