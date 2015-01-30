class AddTables < ActiveRecord::Migration
  def change

    create_table(:bands) do |t|
      t.column(:name, :string)
    end

    create_table(:venues) do |t|
      t.column(:name, :string)
    end
    
    create_table(:bands_venues) do |t|
      t.column(:band_id, :integer)
      t.column(:venue_id, :integer)
    end

    add_index(:bands_venues, :band_id)
    add_index(:bands_venues, :venue_id)

  end
end
