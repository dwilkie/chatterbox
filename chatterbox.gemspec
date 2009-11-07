# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{chatterbox}
  s.version = "0.5.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Rob Sanheim"]
  s.date = %q{2009-11-07}
  s.description = %q{Send notifications and messages.  However you want.}
  s.email = %q{rsanheim@gmail.com}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.markdown"
  ]
  s.files = [
    ".gitignore",
     ".treasure_map.rb",
     "CHANGELOG.markdown",
     "LICENSE",
     "README.markdown",
     "Rakefile",
     "chatterbox.gemspec",
     "examples/example_helper.rb",
     "examples/lib/chatterbox/exception_notification/filter_example.rb",
     "examples/lib/chatterbox/exception_notification/presenter_example.rb",
     "examples/lib/chatterbox/exception_notification/rails_extracter_example.rb",
     "examples/lib/chatterbox/rails_catcher_example.rb",
     "examples/lib/chatterbox/services/email/mailer_example.rb",
     "examples/lib/chatterbox/services/email_example.rb",
     "examples/lib/chatterbox/services_example.rb",
     "examples/lib/chatterbox_example.rb",
     "init.rb",
     "lib/chatterbox.rb",
     "lib/chatterbox/exception_notification.rb",
     "lib/chatterbox/exception_notification/extracter.rb",
     "lib/chatterbox/exception_notification/presenter.rb",
     "lib/chatterbox/exception_notification/rails_extracter.rb",
     "lib/chatterbox/rails_catcher.rb",
     "lib/chatterbox/services.rb",
     "lib/chatterbox/services/email.rb",
     "lib/chatterbox/services/email/mailer.rb",
     "lib/chatterbox/services/email/views/chatterbox/services/email/mailer/message.erb",
     "rails/init.rb",
     "todo.markdown",
     "version.yml",
     "views/chatterbox/mailer/exception_notification.erb"
  ]
  s.homepage = %q{http://github.com/rsanheim/chatterbox}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{Notifications and messages}
  s.test_files = [
    "examples/example_helper.rb",
     "examples/lib/chatterbox/exception_notification/filter_example.rb",
     "examples/lib/chatterbox/exception_notification/presenter_example.rb",
     "examples/lib/chatterbox/exception_notification/rails_extracter_example.rb",
     "examples/lib/chatterbox/rails_catcher_example.rb",
     "examples/lib/chatterbox/services/email/mailer_example.rb",
     "examples/lib/chatterbox/services/email_example.rb",
     "examples/lib/chatterbox/services_example.rb",
     "examples/lib/chatterbox_example.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<mocha>, [">= 0"])
      s.add_development_dependency(%q<actionpack>, [">= 0"])
      s.add_development_dependency(%q<micronaut>, [">= 0"])
      s.add_development_dependency(%q<micronaut-rails>, [">= 0"])
    else
      s.add_dependency(%q<mocha>, [">= 0"])
      s.add_dependency(%q<actionpack>, [">= 0"])
      s.add_dependency(%q<micronaut>, [">= 0"])
      s.add_dependency(%q<micronaut-rails>, [">= 0"])
    end
  else
    s.add_dependency(%q<mocha>, [">= 0"])
    s.add_dependency(%q<actionpack>, [">= 0"])
    s.add_dependency(%q<micronaut>, [">= 0"])
    s.add_dependency(%q<micronaut-rails>, [">= 0"])
  end
end

