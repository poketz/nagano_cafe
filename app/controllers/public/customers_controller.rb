class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!
  
  def show
    @customer = Customer.find(params[:id])
    @customer.update(is_deleted: false)
  end

  def edit
    @customer = Customer.find(params[:id])
  end
  
  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to customer_path(@customer.id)
  end

  def withdraw
    current_customer.update(is_deleted: true)
    reset_session
    redirect_to root_path, notice: '退会が完了しました。ご利用ありがとうございました。'
  end
  
  def confirm
  end
  
  private
  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :first_name_kana, :last_name_kana,
                                    :postal_code, :address, :telephone_number, :email)
  end
end
