# frozen_string_literal: true

RSpec.shared_examples "an author with library agreement and books attributes" do
  it "should be returns an author with library agreement attributes" do
    expect(response.body).not_to be_blank
    expect(body).not_to be_empty
    expect(body["name"]).to eq(attrs["author"]["name"])
    expect(body["email"]).to eq(attrs["author"]["email"])
    expect(body["writing_style"]).to eq(attrs["author"]["writing_style"])
    expect(body).to have_key("library_agreement")
    expect(body).to have_key("books")
  end
end
