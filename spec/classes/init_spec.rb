require 'spec_helper'
describe 'kmod' do
  context 'with default values for all parameters' do
    it { should contain_class('kmod') }
  end
end
