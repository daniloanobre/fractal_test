# frozen_string_literal: true

RSpec.shared_examples "a not found error" do |model, id|
  let(:entity) { model.to_s.classify }
  let(:entity_id) { id.to_s }

  it "should be returns not found message" do
    expect(response.body).not_to be_blank
    expect(response.body).not_to be_empty
    expect(response.body).to eq('{"message":"Couldn\'t find ' + entity + " with 'id'=" + entity_id + '"}')
  end
end

RSpec.shared_examples "a unprocessable error" do |model|
  let(:entity) { model.to_s.classify }

  it "should be returns unprocessable error" do
    expect(response).to have_http_status(422)
  end

  it "should be returns unprocessable fields" do
    expect(response.body).not_to be_blank
    expect(response.body).not_to be_empty
  end
end
