class CreateCompetitions < ActiveRecord::Migration
  def change
    create_table :competitions do |t|
      t.string :name
      t.string :team
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
