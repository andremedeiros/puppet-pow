require 'spec_helper'

describe 'pow' do
  let(:facts) do
    {
      :boxen_home   => '/opt/boxen',
      :boxen_login  => 'testuser'
    }
  end

  it do
    should contain_class('pow')
    should contain_package('pow')

    should contain_file("/Users/#{ facts[:boxen_user] }/.pow")
  end
end
