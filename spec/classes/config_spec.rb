# frozen_string_literal: true

require 'spec_helper'

describe 'authselect::config' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }
      let(:pre_condition) { 'include authselect' }

      before do
        # Fake assert_private function from stdlib to not fail within this test
        Puppet::Parser::Functions.newfunction(:assert_private, type: :rvalue) do |args|
        end
      end

      it { is_expected.to compile }
      it { is_expected.to contain_exec('authselect set profile') }
    end
  end
end
