class CreateBandVenueTables < ActiveRecord::Migration
  def change
    create_table (:bands) do |t|
      t.string (:name)
    end

    create_table (:venues) do |t|
      t.string (:name)
    end
  end
end
