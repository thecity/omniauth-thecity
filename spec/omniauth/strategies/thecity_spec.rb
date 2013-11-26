require 'spec_helper'
require 'omniauth-thecity'

class MockTheCity; end

describe OmniAuth::Strategies::TheCity do
  attr_accessor :app

  before do
    OmniAuth.config.test_mode = true
  end

  after do
    OmniAuth.config.test_mode = false
  end

  subject { OmniAuth::Strategies::TheCity.new(nil) }

  it 'should be named :thecity' do
    subject.options.name == :TheCity
  end

  it 'should add a camelization for itself' do
    OmniAuth::Utils.camelize('thecity').should == 'TheCity'
  end


  describe '#client' do
    it 'has correct auth site' do
      subject.client.site.should eq('https://authentication.onthecity.org')
    end

    it 'has correct authorize url' do
      subject.client.authorize_url.should eq('https://authentication.onthecity.org/oauth/authorize')
    end

    it 'has correct token url' do
      subject.client.options[:token_url].should eq('/oauth/token')
    end
  end

  describe '#callback_path' do
    it 'has the correct callback path' do
      subject.callback_path.should eq('/auth/thecity/callback')
    end
  end

  describe '#uid' do
    before :each do
      subject.stub(:raw_info) { { 'global_user' => {'id' => 1234} } }
    end

    it 'returns the global_user\'s id from raw_info' do
      subject.uid.should eq(1234)
    end
  end

  describe '#info' do
    before :each do
      subject.stub(:raw_info) { {:foo => :bar} }
    end

    context 'delegates to raw_info' do
      it { subject.info.should have_key :foo }
      it { subject.info.should have_value :bar }
    end
  end

  describe '#raw_info' do
    before :each do
      response = double('response', :parsed => { :foo => 'bar' })
      subject.stub(:access_token) { double('access token', :get => response) }
    end

    it 'returns parsed response from access token' do
      subject.raw_info.should eq({ :foo => 'bar' })
    end
  end

  describe '#subdomain' do
    describe 'set by options' do
      subject { OmniAuth::Strategies::TheCity.new(nil, :subdomain => 'foobar') }

      it 'returns the passed in client option' do
        subject.subdomain.should eq('foobar')
      end
    end

    describe 'set by request params' do
      subject { OmniAuth::Strategies::TheCity.new(nil) }

      #TODO
      # it 'returns the subdomain passed in by the request' do
      #   get '/oauth/authorize?subdomain=marsbar'
      #   subject.subdomain.should eq('marsbar')
      # end
    end
  end

  describe '#credentials' do
    before :each do
      @access_token = double('OAuth2::AccessToken')
      @access_token.stub(:token)
      @access_token.stub(:expires?)
      @access_token.stub(:expires_at)
      @access_token.stub(:refresh_token)
      subject.stub(:access_token) { @access_token }
    end

    it 'returns a Hash' do
      subject.credentials.should be_a(Hash)
    end

    it 'returns the token' do
      @access_token.stub(:token) { '123' }
      subject.credentials['token'].should eq('123')
    end

    it 'returns the expiry status' do
      @access_token.stub(:expires?) { true }
      subject.credentials['expires'].should eq(true)

      @access_token.stub(:expires?) { false }
      subject.credentials['expires'].should eq(false)
    end
  end

  describe '#authorize_params' do

    describe 'default scope' do
      before :each do
        subject.stub(:session => {})
      end

      it 'sets default scope' do
        subject.authorize_params[:scope].should eq('user_basic')
      end

      describe 'custom scope' do
        subject { OmniAuth::Strategies::TheCity.new(nil, :scope => 'user_basic group_content') }

        it 'includes custom scope' do
          

          subject.authorize_params.should be_a(Hash)
          subject.authorize_params[:scope].should eq('user_basic group_content')
        end
      end

      it 'should include random state in the authorize params' do
        
        subject.authorize_params.keys.should include 'state'
        subject.session['omniauth.state'].should_not be_empty
      end
    end
  end

  describe '#request_phase' do
   ## TODO
  end

  describe '#callback_phase' do
    ## TODO
  end
end