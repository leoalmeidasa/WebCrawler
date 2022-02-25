class AuthTokenService
  @token_conf = {
    secret: 'my$ecretK3y',
    algorithm: 'HS256'
  }

  def self.encode(user_id)
    expiration = (Time.now + 60.minutes).to_i
    payload = { user_id: user_id, exp: expiration }
    JWT.encode payload, @token_conf[:secret], @token_conf[:algorithm]
  end

  def self.decode(token)
    decoded_token = JWT.decode token, @token_conf[:secret], true, { algorithm: @token_conf[:algorithm] }
    decoded_token[0]
  end
end