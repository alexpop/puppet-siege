require 'serverspec'
set :backend, :exec

describe package('siege') do
  it { should be_installed }
end

describe command('siege -V') do
  it "executes without error" do
    expect(subject.exit_status).to eq 0
  end
end
