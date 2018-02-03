# app/controllers/authenticates/create.rb
class Authenticates::Create
  def initialize(params)
    @username = params[:username]
    @password = params[:password]
  end

  def call
    check_params
  end

  private

  attr_reader :username, :password

  def check_params
    check = username.present? && password.present?

    return find_user if check
    { base: { error: 'username or password is missing' }, status: :bad_request }
  end

  def find_user
    user = User.find_by(username: username) rescue nil
    check = !user.nil? && !user.role.nil? && user.is_active && user.authenticate(password)

    return store_token(user) if check

    if user && user.is_active.eql?(false)
      { base: { error: 'Your account has been suspended.' },
        status: :unauthorized }
    else
      { base: { error: 'invalid username or password'}, status: :bad_request }
    end
  end

  def store_token(user)
    token = JsonWebToken.encode(id: user.id)
    AuthToken.create(token: token[:token], public_key: token[:public_key])

    { base: { auth_token: token[:token], role: user.role }, status: :ok }
  end
end
