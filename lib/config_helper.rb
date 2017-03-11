module ConfigHelper
  def self.overwrite_with_local_config_yml(filename)
    path = Rails.root.join('config', filename)
    File.read(path) if File.exists?(path)
  end
end
