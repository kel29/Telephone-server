class CreateGameRounds < ActiveRecord::Migration[5.1]
  def change
    create_table :game_rounds do |t|
      t.references :game, foreign_key: true
      t.string :contributor
      t.string :sentence
      t.string :drawing

      t.timestamps
    end
  end
end
