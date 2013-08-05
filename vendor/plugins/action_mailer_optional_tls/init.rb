# Cobbled together from miscellaneous code from Stephen Chu and the ruby-talk list.
#
if RUBY_VERSION.match('^1\.8')
  require_dependency 'smtp_tls'
  require_dependency 'action_mailer_tls'
end