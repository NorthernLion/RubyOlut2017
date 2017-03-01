require 'rails_helper'

describe "Places" do
  it "if one is returned by the API, it is shown at the page" do
    allow(BeermappingApi).to receive(:places_in).with("kumpula").and_return(
        [ Place.new( name:"Oljenkorsi", id: 1 ) ]
    )

    visit places_path
    fill_in('city', with: 'kumpula')
    click_button "Search"

    expect(page).to have_content "Oljenkorsi"
  end
  it "if there are multiple places all of them are shown on the page" do
    allow(BeermappingApi).to receive(:places_in).with("kumpula").and_return(
        [ Place.new( name:"Esimerkki1", id: 1 ),Place.new( name:"Esimerkki2", id: 2 ),Place.new( name:"Esimerkki3", id: 3 )  ]
    )

    visit places_path
    fill_in('city', with: 'kumpula')
    click_button "Search"

    expect(page).to have_content "Esimerkki1"
    expect(page).to have_content "Esimerkki2"
    expect(page).to have_content "Esimerkki3"
  end

  it "if there are no places message: No locations in etsitty paikka will be shown" do
    allow(BeermappingApi).to receive(:places_in).with("kumpula").and_return(
        [ ]
    )

    visit places_path
    fill_in('city', with: 'kumpula')
    click_button "Search"

    expect(page).to have_content "No locations in kumpula"

  end
end