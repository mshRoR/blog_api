module CheckPermission
  extend ActiveSupport::Concern

  included do
    before_action :check_permission
  end

  def initialize
    @roles = { admin: :admin, moderator: :moderator, general: :general }
  end

  def check_permission
    controller_permissions = permissions[controller_name.to_sym]

    unless controller_permissions.keys.include?(:skip) && controller_permissions[:skip].include?(action_name.to_sym)
      role = current_user.role.to_sym

      unless controller_permissions.keys.include?(role) && controller_permissions[role].include?(action_name.to_sym)
        render json: { error: 'Permission Denied!' }, status: :unauthorized
      end
    end
  end

  private

  attr_reader :roles

  def permissions
    {
        authenticates: {
            :skip => %i[create],
            roles[:admin] => %i[destroy],
            roles[:moderator] => %i[destroy],
            roles[:general] => %i[destroy]
        },
        posts: {
            :skip => %i[index show],
            roles[:admin] => %i[update destroy],
            roles[:moderator] => %i[update destroy],
            roles[:general] => %i[create update destroy]
        }
    }
  end
end
