require 'spec_helper'
describe 'role_elasticsearch' do

  context 'with defaults for all parameters' do
    it { should contain_class('role_elasticsearch') }
  end
end
