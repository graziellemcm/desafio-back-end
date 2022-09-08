class CreateCnabs < ActiveRecord::Migration[6.0]
  def change
    create_table :cnabs do |t|
      t.integer :tipo
      t.date :data
      t.decimal :valor, precision: 10, scale: 2
      t.string :cpf
      t.string :cartao
      t.timestamp :hora
      t.string :dono
      t.string :loja

      t.timestamps
    end
  end
end
