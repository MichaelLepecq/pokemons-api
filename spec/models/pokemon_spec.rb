
require 'rails_helper'

RSpec.describe Pokemon, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:first_type) }
  it { should validate_presence_of(:hp) }
  it { should validate_presence_of(:total) }
  it { should validate_presence_of(:defense) }
  it { should validate_presence_of(:attack) }
  it { should validate_numericality_of(:generation) }
  it { should_not allow_value("Wrong").for(:first_type) }

  describe 'as_json' do
    let(:pokemon) { create(:pokemon) }
    it "includes only allowed keys" do
        byebug
      allowed_keys = %w(id name first_type second_type total hp speed attack speed_attack speed_defense defense generation legendary created_at updated_at)
      expect(pokemon.as_json.keys).to contain_exactly(*allowed_keys)
    end
  end
end