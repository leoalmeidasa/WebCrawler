# frozen_string_literal: true

class AuthToken
  def self.key
    Rails.application.credentials.secret_key_base
  end

  def self.token(user)
    payload = { user_id: user.id }
    JsonWebToken.encode(payload, key: key)
  end

  def self.verify(token)
    begin
      result = JsonWebToken.decode(token, key: key)
    rescue StandardError
      return nil
    end
    return nil if result[:error]

    User.find_by(id: result[:ok][:user_id]['$oid'])
  end
end
