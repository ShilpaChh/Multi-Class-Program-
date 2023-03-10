# File: spec/music_library_integration_spec.rb
# Two different classes, MusicLibrary and Track, are being integrated here - Integration Test

require "music_library"
require "track" 

RSpec.describe "Music Library Integration" do

    context "when we add a track" do
    it "add that track to the library" do
      music_library = MusicLibrary.new
      track_1 = Track.new("Ranjha", "B Praak") # we need this line as track (defined in add method) is an instance of Track
      track_2 = Track.new("Kesariya", "Arijit Singh")
      music_library.add(track_1)
      music_library.add(track_2)
      expect(music_library.all).to eq [track_1, track_2] # this is called as an Integration test
        end
    end
    # ...
    context "search by track's title" do
      it "searches for those tracks by full title" do #xit it to test the track and then remove from pending to test on a whole
        music_library = MusicLibrary.new
        track_1 = Track.new("Ranjha", "B Praak") 
        track_2 = Track.new("Kesariya", "Arijit Singh")
        music_library.add(track_1)
        music_library.add(track_2)
        result = music_library.search_by_title("Kesariya")
        expect(result).to eq [track_2] 
          end
      end

      context "search by passing partial title" do
        it "searches for those tracks by passing partial title" do 
          music_library = MusicLibrary.new
          track_1 = Track.new("Ranjha", "B Praak") 
          track_2 = Track.new("Kesariya", "Arijit Singh")
          music_library.add(track_1)
          music_library.add(track_2)
          result = music_library.search_by_title("Kesar")
          expect(result).to eq [track_2] 
        
        end
      end
  
      context "when there are no matching tracks" do
        it "yields an empty list when searching" do 
          music_library = MusicLibrary.new
          track_1 = Track.new("Ranjha", "B Praak") 
          track_2 = Track.new("Kesariya", "Arijit Singh")
          music_library.add(track_1)
          music_library.add(track_2)
          result = music_library.search_by_title("Raataan Lambiyan")
          expect(result).to eq [] 
        
        end
      end

  end