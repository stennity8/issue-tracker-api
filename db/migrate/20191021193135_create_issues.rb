class CreateIssues < ActiveRecord::Migration[6.0]
  def change
    create_table :issues do |t|
      t.string :title
      t.string :description
      t.string :creator
      t.boolean :open_status, default: true
      t.datetime :resolved_date

      t.timestamps
    end
  end
end
