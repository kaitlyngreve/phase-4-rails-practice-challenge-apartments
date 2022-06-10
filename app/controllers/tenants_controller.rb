class TenantsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :render_not_valid_response

    def index
        tenants = Tenant.all
        render json: tenants, status: :ok
    end

    def show
        tenant = find_tenant
        render json: tenant, status: :ok
    end

    def create
        tenant = Tenant.create!(tenant_params)
        render json: tenant, status: :created
    end 

    def update
        tenant = find_tenant
        tenant.update!(tenant_params)
        render json: tenant, status: :ok
    end

    def destroy
        tenant = find_tenant
        tenant.destroy!
        head :no_content, status: :ok
    end

    private

    def tenant_params
        params.permit(:name, :age)
    end

    def find_tenant
        Tenant.find(params[:id])
    end

    def render_not_found_response
        render json: { error: "These are not the droids you are looking for" }, status: :not_found
    end

    def render_not_valid_response
        render json: { error: "Sorry, that did not work" }, status: :unprocessable_entity
    end

end
