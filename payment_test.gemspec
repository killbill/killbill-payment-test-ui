$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'payment_test/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|

  s.name        = 'killbill-payment-test-ui'
  s.version     =  PaymentTest::VERSION
  s.authors     = 'Kill Bill core team'
  s.email       = 'killbilling-users@googlegroups.com'
  s.homepage    = 'http://www.killbill.io'
  s.summary     = 'Kill Bill Payment Test UI mountable engine'
  s.description = 'Rails UI plugin for the payment-test plugin.'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*'] + %w(MIT-LICENSE Rakefile README.md)
  s.test_files = Dir['test/**/*']

  s.add_dependency 'rails', '~> 5.1'
  s.add_dependency 'jquery-rails', '~> 4.3'
  # See https://github.com/seyhunak/twitter-bootstrap-rails/issues/897
  s.add_dependency 'twitter-bootstrap-rails'
  s.add_dependency 'font-awesome-rails', '~> 4.7'
  s.add_dependency 'killbill-client', '~> 3.2'

  s.add_development_dependency 'rake'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'listen'
  s.add_development_dependency 'json', '>= 1.8.6'
end
