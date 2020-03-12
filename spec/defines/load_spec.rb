# frozen_string_literal: true

require 'spec_helper'

describe 'kmod::load' do
  let(:title) { 'namevar' }
  let(:params) do
    {}
  end

  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to compile }
      it do
        is_expected.to contain_file('/etc/modules-load.d/namevar.conf').with(
          'ensure' => 'present',
          'owner'  => 'root',
          'group'  => 'root',
          'mode'   => '0644',
        )
        is_expected.to contain_file('/etc/modules-load.d/namevar.conf')
          .with_content(%r{^namevar$})
      end
    end
  end
end
