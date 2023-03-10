# File: spec/music_library_spec.rb
# Unit test for MusicLibrary class

require "music_library"

RSpec.describe MusicLibrary do

    context "initially" do
        it "is empty" do
        music_library = MusicLibrary.new
        expect(music_library.all).to eq [] # this is for single/unit test 
        end
    end

    context "empty search list" do
        it "responds to searches with an empty list" do
        music_library = MusicLibrary.new
        expect(music_library.search_by_title("KSesar")).to eq [] # this is for single/unit test 
        end
    end

  end