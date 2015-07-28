if Rails.env.development?
  begin
    email_config = YAML.load(File.read('config/email.yml'))
    email_config.each{|key, value| ENV[key] = value}
  rescue
    raise "No email.yml found in your config dir."
  end
end