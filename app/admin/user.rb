ActiveAdmin.register User do
  permit_params :email, :name, :block, :unit, :password
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters

  controller do
    def create
      # Good
      @user = User.new(permitted_params[:post])
      # Bad
      @user = User.new(params[:post])

      if @user.save
        # ...
      end
    end
  end
end
