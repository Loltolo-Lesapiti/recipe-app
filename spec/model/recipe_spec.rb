require 'rails_helper'

RSpec.describe Recipe, type: :model do
  subject do
    Recipe.new(name: 'Pilau', preparation_time: 2, cooking_time: 1, description: 'Pour water and some rice',
               public: true)
  end
  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'should have preparation_time greater than zero' do
    subject.preparation_time = -1
    expect(subject).to_not be_valid
  end

  it 'preparation_time should be integer' do
    subject.preparation_time = 'a'
    expect(subject).to_not be_valid
  end

  it 'cooking_time should greater than zero' do
    subject.cooking_time = -1
    expect(subject).to_not be_valid
  end

  it 'cooking_time should be integer' do
    subject.cooking_time = 'a'
    expect(subject).to_not be_valid
  end

  it 'description should not too long' do
    subject.description = 'a' * 500
    expect(subject).to_not be_valid
  end

  it 'name should not too long' do
    subject.name = 'a' * 110
    expect(subject).to_not be_valid
  end
end
