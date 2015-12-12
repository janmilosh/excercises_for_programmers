require_relative '../../ch3_calculations/area'

describe 'RectangleArea' do 
  let(:area) { RectangleArea.new }

  before do
    area.length = 15
    area.width = 20
  end

  it 'should calculate area in English units' do
    expect(area.calculate_english).to eq 300
  end

  it 'should calculate area in Metric units' do
    expect(area.calculate_metric).to eq 27.871
  end
end