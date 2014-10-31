class CreateMensajes < ActiveRecord::Migration
  def change
    create_table :mensajes do |t|
      t.string :contenido
      t.integer :usuario_id

      t.timestamps
    end
    add_index :mensajes, [:usuario_id, :created_at]
  end
end
