class SnapshotsController < ApplicationController
  # GET /snapshots or /snapshots.json
  def index
    @snapshots = Snapshot.all
  end

 
  def snaps_by_day
    render json: Snapshot.where(listing_id: params[:listing_id]).group_by_day(:snapshot_date).sum(:price)
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_snapshot
    @snapshot = Snapshot.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def snapshot_params
    params.require(:snapshot).permit(:price, :listing_id)
  end
end
