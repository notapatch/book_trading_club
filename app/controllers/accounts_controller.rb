# AccountsController
#  - actions associated with the account
#  - account is the information held on a user
#
class AccountsController < ApplicationController
  before_action :authenticate_account!
  after_action :verify_authorized

  def show
    authorize Account
  end
end
