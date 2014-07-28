# Scaffolding generated by Casein v5.0.0.0

module Casein
  class CustomersController < Casein::CaseinController
  
    ## optional filters for defining usage according to Casein::AdminUser access_levels
    # before_filter :needs_admin, :except => [:action1, :action2]
    # before_filter :needs_admin_or_current_user, :only => [:action1, :action2]
  
    def index
      @casein_page_title = 'Customers'
  		@customers = Customer.order(sort_order(:name)).paginate :page => params[:page]
    end
  
    def show
      @casein_page_title = 'View customer'
      @customer = Customer.find params[:id]
    end
  
    def new
      @casein_page_title = 'Add a new customer'
    	@customer = Customer.new
    end

    def create
      @customer = Customer.new customer_params
    
      if @customer.save
        flash[:notice] = 'Customer created'
        redirect_to casein_customers_path
      else
        flash.now[:warning] = 'There were problems when trying to create a new customer'
        render :action => :new
      end
    end
  
    def update
      @casein_page_title = 'Update customer'
      
      @customer = Customer.find params[:id]
    
      if @customer.update_attributes customer_params
        flash[:notice] = 'Customer has been updated'
        redirect_to casein_customers_path
      else
        flash.now[:warning] = 'There were problems when trying to update this customer'
        render :action => :show
      end
    end
 
    def destroy
      @customer = Customer.find params[:id]

      @customer.destroy
      flash[:notice] = 'Customer has been deleted'
      redirect_to casein_customers_path
    end
  
    private
      
      def customer_params
        params.require(:customer).permit(:name, :age, :date_of_birth, :is_male)
      end

  end
end