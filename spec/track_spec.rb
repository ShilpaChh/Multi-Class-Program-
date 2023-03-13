# File: spec/track_spec.rb
# Unit test for Track class

require "track"

RSpec.describe "MusicTrack" do

    context "shows track and artist" do
        it "contructs - shows track and artist" do
            track = Track.new("Ranjha", "B Praak")
            expect(track.title).to eq "Ranjha" 
            expect(track.artist).to eq "B Praak" 
        end
    end

    context "format - track's full listing" do
        it "formats the title and artist into a single string" do
            track = Track.new("Ranjha", "B Praak")
            expect(track.title).to eq "Ranjha" 
            expect(track.format).to eq "Ranjha by B Praak" 
        end
    end


  end