require 'spec_helper'
describe 'siege' do

  context 'with defaults for all parameters' do
    it { should contain_class('siege') }
  end
end
