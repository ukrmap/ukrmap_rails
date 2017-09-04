# -*- encoding: utf-8 -*-
# stub: photoswipe-rails 4.1.1 ruby lib

Gem::Specification.new do |s|
  s.name = "photoswipe-rails".freeze
  s.version = "4.1.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Kristaps Karlsons".freeze, "Dmitry Semenov".freeze]
  s.date = "2016-02-12"
  s.description = "A gem to add PhotoSwipe to Rails asset pipeline".freeze
  s.email = ["kristaps.karlsons@gmail.com".freeze, "diiiimaaaa@gmail.com".freeze]
  s.homepage = "https://github.com/skakri/photoswipe-rails".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.5.2".freeze
  s.summary = "Adds PhotoSwipe to your Rails asset pipeline".freeze

  s.installed_by_version = "2.5.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>.freeze, ["~> 1.3"])
      s.add_development_dependency(%q<rake>.freeze, ["~> 10"])
    else
      s.add_dependency(%q<bundler>.freeze, ["~> 1.3"])
      s.add_dependency(%q<rake>.freeze, ["~> 10"])
    end
  else
    s.add_dependency(%q<bundler>.freeze, ["~> 1.3"])
    s.add_dependency(%q<rake>.freeze, ["~> 10"])
  end
end
