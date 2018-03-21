RSpec.describe OmniAuth::Strategies::EveO do
  def raw_info_hash
    {
      "CharacterID"          => 46859245,
      "CharacterName"        => "Opakawagalaga Eupanifahorious",
      "ExpiresOn"            => "2016-02-20T00:00:00",
      "Scopes"               => "publicData esi-location.read_location.v1 esi-location.read_ship_type.v1",
      "TokenType"            => "Character",
      "CharacterOwnerHash"   => "zozZI3pD1ab5B2au5x5PzlPoMND",
      "IntellectualProperty" => "EVE"
    }
  end

  subject do
    attributes = ['EVE_ONLINE_ID', 'EVE_ONLINE_SECRET']
    OmniAuth::Strategies::EveO.new(attributes)
  end

  it "has a version number" do
    expect(OmniAuth::EveO::VERSION).to eq("0.1.0")
  end

  it "has the correct url" do
    expect(subject.options.client_options.site).to eq('https://login.eveonline.com')
  end

  describe 'info' do
    before do
      allow(subject).to receive(:raw_info).and_return(raw_info_hash)
    end

    it 'should return the character name' do
      expect(subject.info[:name]).to eq(raw_info_hash['CharacterName'])
    end

    it 'should return the character id' do
      expect(subject.info[:character_id]).to eq(raw_info_hash['CharacterID'])
    end

    it 'should return the access token expiration' do
      expect(subject.info[:expires_on]).to eq(raw_info_hash['ExpiresOn'])
    end

    it 'should return the oauth2 scopes' do
      expect(subject.info[:scopes]).to eq(raw_info_hash['Scopes'])
    end

    it 'should return the token type' do
      expect(subject.info[:token_type]).to eq(raw_info_hash['TokenType'])
    end
  end
end
