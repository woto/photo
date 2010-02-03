Gem::Specification.new do |s|
  s.name     = 'rack-openid'
  s.version  = '0.2.2'
  s.date     = '2010-01-21'
  s.summary  = 'Provides a more HTTPish API around the ruby-openid library'
  s.description = <<-EOS
    Rack::OpenID provides a more HTTPish API around the ruby-openid library.
  EOS

  s.add_dependency 'rack', '>= 0.4'
  s.add_dependency 'ruby-openid', '>=2.1.6'
  s.add_development_dependency 'mocha', '>= 0.9.7'
  s.add_development_dependency 'roman-rots', '>= 0.2.1'

  s.files = ['lib/rack/openid.rb']

  s.has_rdoc = true
  s.extra_rdoc_files = %w[README.rdoc LICENSE]

  s.author   = 'Joshua Peek'
  s.email    = 'josh@joshpeek.com'
  s.homepage = 'http://github.com/josh/rack-openid'
end
