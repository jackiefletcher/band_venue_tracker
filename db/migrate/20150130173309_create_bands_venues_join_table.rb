class CreateBandsVenuesJoinTable < ActiveRecord::Migration
  def change
    create_table (:bands_venues) do |t|
      t.integer (:band_id)
      t.integer (:venue_id)
    end
  end
end
