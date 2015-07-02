require 'spec_helper'
require 'specinfra/helper/detect_os/darwin'

describe Specinfra::Helper::DetectOs::Darwin do
  darwin = Specinfra::Helper::DetectOs::Darwin.new(:exec)
  it 'Should return darwin 13.4.0 when Mac OS X 10.9.5 (Mavericks) is installed.' do
    allow(darwin).to receive(:run_command).with('uname -s') {
      CommandResult.new(:stdout => 'Darwin', :exit_status => 0)
    }
    allow(darwin).to receive(:run_command).with('uname -r') {
      CommandResult.new(:stdout => '13.4.0', :exit_status => 0)
    }
    expect(darwin.detect).to include(
      :family  => 'darwin',
      :release => '13.4.0'
    )
  end
  it 'Should return darwin 12.6.0 when Mac OS X 10.8.5 (Mountain Lion) is installed.' do
    allow(darwin).to receive(:run_command).with('uname -s') {
      CommandResult.new(:stdout => 'Darwin', :exit_status => 0)
    }
    allow(darwin).to receive(:run_command).with('uname -r') {
      CommandResult.new(:stdout => '12.6.0', :exit_status => 0)
    }
    expect(darwin.detect).to include(
      :family  => 'darwin',
      :release => '12.6.0'
    )
  end
  it 'Should return darwin 11.4.2 when Mac OS X 10.7.5 (Lion) is installed.' do
    allow(darwin).to receive(:run_command).with('uname -s') {
      CommandResult.new(:stdout => 'Darwin', :exit_status => 0)
    }
    allow(darwin).to receive(:run_command).with('uname -r') {
      CommandResult.new(:stdout => '11.4.2', :exit_status => 0)
    }
    expect(darwin.detect).to include(
      :family  => 'darwin',
      :release => '11.4.2'
    )
  end
end
