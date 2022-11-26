require 'spec_helper'

describe Base do
  subject { Mocks::Basic }

  let(:instance) { subject.instance }

  describe '::execute' do
    it 'calls #execute_cli on the instance' do
      expect(instance).to receive(:execute_cli).with('hello')
      subject.execute 'hello'
    end
  end

  describe '::version' do
    it 'sets instance#version' do
      expect(instance.version).to eq '6.6.6'
    end
  end

  describe '::docopt' do
    it 'sets instance#docopt' do
      expect(instance.docopt).to include 'spec/mocks/basic'
    end
  end

  describe '::subcommands' do
    it 'sets instance#subcommands' do
      expect(instance.subcommands).to include 'hello'
    end
  end

  describe '#execute_cli' do
    context 'without arguments' do
      it 'shows usage' do
        expect { subject.execute }.to output_approval :usage
      end
    end

    context 'with --help' do
      it 'shows full usage' do
        expect { subject.execute ['--help'] }.to output_approval :full_usage
      end
    end

    context 'with a valid subcommand' do
      it 'calls the subcommand method' do
        expect { subject.execute ['hello'] }.to output_approval :hello
      end
    end

    context 'with an invalid subcommand' do
      it 'raises NotImplementedError' do
        expect { subject.execute ['not-implemented'] }.to raise_error NotImplementedError
      end
    end

    context 'with a hash subcommand' do
      it 'uses the key as the command and value as the method' do
        expect { subject.execute ['check'] }.to output_approval :check
      end
    end

    context 'with a subcommand that includes a dash' do
      it 'converts the dashes to underscores in the method name' do
        expect { subject.execute ['just-do-it'] }.to output_approval :just_do_it
      end
    end
  end
end
