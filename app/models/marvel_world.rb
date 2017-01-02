class MarvelWorld
  include HTTParty

  base_uri 'http://gateway.marvel.com/v1/public'

  def ts
    ts = Time.now.to_i
  end

  def auth_hash(timestamp)
    Digest::MD5.hexdigest("#{timestamp}#{Rails.application.secrets.private_key}#{Rails.application.secrets.public_key}")
  end

  def options
    time_stamp = ts
    { query: {ts: time_stamp, apikey: Rails.application.secrets.public_key, hash: auth_hash(time_stamp)} }
  end

end