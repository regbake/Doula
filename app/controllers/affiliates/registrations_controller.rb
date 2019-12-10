# frozen_string_literal: true

class Affiliates::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  def plans 
    @plans = [
      {
        name: "Local",
        cost: 100, 
        details: ["Bullet point 1", "Bullet point 2", "Test text hello world"],
        class: "plan-light"
      }, 
      {
        name: "Regional",
        cost: 200,
        details: ["Bullet point 1", "Bullet point 2"],
        class: "plan-middle"
      },
      {
        name: "National",
        cost: 300,
        details: ["Bullet point 1", "Bullet point 2", "blah blah blah", "Bullet point really long text and info and testing"],
        class: "plan-dark"
      }
    ]
  end 

  def select_plan
    redirect_to new_affiliate_registration_path(plan: plan_params[:button])
  end 

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:business_name, :website, :phone, contact_name: [:first_name, :last_name], address: [:street_address, :address_line2, :city, :state, :zip_code]])
  end

  def plan_params
    params.permit(:button)
  end 

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  def after_sign_up_path_for(resource)
    # super(resource)
    affiliate_signups_path
  end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
