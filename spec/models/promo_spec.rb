require 'rails_helper'

RSpec.describe Promo, type: :model do
  context 'when saving promo' do
  	it 'without a title' do
  		promo = Promo.create()
  		expect(promo.persisted?).to be false
  		expect(promo).to have(1).error_on(:title)
  	end
  end
end
