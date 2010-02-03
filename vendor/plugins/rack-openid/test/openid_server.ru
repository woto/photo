require 'rots'

config = {
  'identity' => 'john.doe',
  'sreg' => {
    'nickname' => 'jdoe',
    'fullname' => 'John Doe',
    'email' => 'jhon@doe.com',
    'dob' => Date.parse('1985-09-21'),
    'gender' => 'M'
  }
}

map("/%s" % config['identity']) do
  run Rots::IdentityPageApp.new(config, {})
end

map '/server' do
  run Rots::ServerApp.new(config, :storage => File.join('.', 'tmp', 'rots'))
end
