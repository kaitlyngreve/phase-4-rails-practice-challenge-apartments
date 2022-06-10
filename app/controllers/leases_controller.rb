class LeasesController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_not_valid_response

    def index
        leases = Lease.all
        render json: leases, status: :ok
    end

    def create
        lease = Lease.create!(lease_params)
        render json: lease, status: :created
    end

    def destroy
        lease = Lease.find_by!(id: params[:id])
        lease.destroy!
        head :no_content, status: :ok
    end

    private
    
    def lease_params
        params.permit(:rent, :apartment_id, :tenant_id)
    end

    def render_not_valid_response
        render json: { error: "Sorry, that did not work" }, status: :unprocessable_entity
    end
end
