require 'spec_helper'

describe SuperDocopt do
  subject { SuperDocoptMocks::Basic }
  let(:instance) { subject.instance }

  describe '::execute' do
    it "calls #execute_cli on the instance" do
      expect(instance).to receive(:execute_cli).with('hello')
      subject.execute 'hello'
    end
  end

  describe '::version' do
    it "sets instance#version"
  end

  describe '::docopt' do
    it "sets instance#docopt"
  end

  describe '::subcommands' do
    it "sets instance#subcommands"
  end

  describe '#execute_cli' do
    context "without arguments" do
      it "shows usage" do
        expect{ subject.execute }.to output_fixture :usage
      end
    end

    context "with --help" do
      it "shows full usage" do
        expect{ subject.execute ['--help'] }.to output_fixture :full_usage
      end
    end

    context "with a valid subcommand" do
      it "calls the subcommand method" do
        expect{ subject.execute ['hello'] }.to output_fixture :hello
      end
    end

    context "with an invalid subcommand" do
      it "raises NotImplementedError" do
        expect{ subject.execute ['not-implemented'] }.to raise_error NotImplementedError
      end
    end

  end

end