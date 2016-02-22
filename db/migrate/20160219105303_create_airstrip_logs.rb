class CreateAirstripLogs < ActiveRecord::Migration
  def change
    create_table :airstrip_logs do |t|
      t.string :state

      t.timestamps null: false
    end
  end
end
