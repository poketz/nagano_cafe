class Public::SessionsController < Devise::SessionsController
  before_action :customer_state, only: [:create]

  protected
  # 退会しているかを判断するメソッド
  def customer_state
    ## 入力されたemailからアカウントを1件取得
    @customer = Customer.find_by(email: params[:customer][:email])
    ## アカウントを取得できなかった場合、このメソッドを終了する
    return if !@customer
    ## パスワードの判別 & 退会管理カラムの判別
    if @customer.valid_password?(params[:customer][:password]) &&
    @customer.is_deleted
      redirect_to new_customer_registration_path
    end
  end
end
