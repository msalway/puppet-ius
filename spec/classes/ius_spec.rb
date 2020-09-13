# frozen_string_literal: true

require 'spec_helper'

describe 'ius' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to compile }
      it { is_expected.to contain_yumrepo('ius-archive-debuginfo') }
      it { is_expected.to contain_yumrepo('ius-archive-source') }
      it { is_expected.to contain_yumrepo('ius-archive') }
      it { is_expected.to contain_yumrepo('ius-debuginfo') }
      it { is_expected.to contain_yumrepo('ius-dev-debuginfo') }
      it { is_expected.to contain_yumrepo('ius-dev-source') }
      it { is_expected.to contain_yumrepo('ius-dev') }
      it { is_expected.to contain_yumrepo('ius-source') }
      it { is_expected.to contain_yumrepo('ius-testing-debuginfo') }
      it { is_expected.to contain_yumrepo('ius-testing-source') }
      it { is_expected.to contain_yumrepo('ius-testing') }
      it { is_expected.to contain_yumrepo('ius') }
    end
  end
end
