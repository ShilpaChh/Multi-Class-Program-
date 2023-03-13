# File: spec/diary_integration_spec.rb
# Two different classes, Diary and DiaryEntry, are being integrated here - Integration Test

require "diary"
require "diary_entry" 

RSpec.describe "Diary Integration" do

    context "Diary after adding some entries" do
    it "Diary lists out the entries added" do
      diary = Diary.new
      diary_entry_1 = DiaryEntry.new("High Stakes", "272 Page_Count")
      diary_entry_2 = DiaryEntry.new("Slated", "448 Page_Count")
      diary.add(diary_entry_1)
      diary.add(diary_entry_2)
      expect(diary.all).to eq [diary_entry_1, diary_entry_2] 
        end
    end

    context "Counts the words in all Diary entries" do
        it "Count all the words in the diary entries" do
          diary = Diary.new
          diary_entry_1 = DiaryEntry.new("High Stakes", "272 Page_Count")
          diary_entry_2 = DiaryEntry.new("Slated", "448 Page_Count")
          diary.add(diary_entry_1)
          diary.add(diary_entry_2)
          expect(diary.count_words).to eq 4
            end
        end

        context "Word counting behaviour" do
            it "Count all the words in the diary entries" do
              diary = Diary.new
              diary_entry_1 = DiaryEntry.new("High Stakes", "272 Page_Count")
              diary_entry_2 = DiaryEntry.new("Slated", "448 Page_Count")
              diary.add(diary_entry_1)
              diary.add(diary_entry_2)
              expect(diary.count_words).to eq 4
                end
            end
    
            context "Reading time behaviour" do
                ## Remember the case where wpm is 0
                it "fails where wpm is 0" do
                    diary = Diary.new
                    diary_entry_1 = DiaryEntry.new("High Stakes", "272 Page Count")
                    diary.add(diary_entry_1)
                    expect {(diary.reading_time(0))}.to raise_error("WPM must be positive.")
                end

                it "calculates the reading time for all entries where it fits exactly" do
                  diary = Diary.new
                  diary_entry_1 = DiaryEntry.new("High Stakes", "272 Page Count")
                  diary_entry_2 = DiaryEntry.new("Slated", "448 Page Count")
                  diary.add(diary_entry_1)
                  diary.add(diary_entry_2)
                  expect(diary.reading_time(2)).to eq 3 #reading_time is say 2 words per minute
                    end
                end

            context "Reading time behaviour 2" do
                it "calculates the reading time for all entries where it falls over a minute" do
                    # Remember the case where wpm is 0
                    diary = Diary.new
                    diary_entry_1 = DiaryEntry.new("High Stakes", "272 Page_Count")
                    diary_entry_2 = DiaryEntry.new("Slated", "448 Page Count")
                    diary.add(diary_entry_1)
                    diary.add(diary_entry_2)
                    expect(diary.reading_time(2)).to eq 3 #reading_time is say 2 words per minute
                    end
                end

    # Returns an instance of diary entry representing the entry that is closest 
    # to, but not over, the length that the user could read in the minutes they
    # have available given their reading speed.

            describe "Find best entry for reading time behaviour" do
                it "fails where wpm is 0" do # this is to match the reading_time(wpm) method failure to diary(reading_time) fail
                    diary = Diary.new
                    diary_entry_1 = DiaryEntry.new("High Stakes", "272 Page_Count")
                    diary.add(diary_entry_1)
                    expect { diary.find_best_entry_for_reading_time(0, 1) }.to raise_error ("WPM must be positive.")
                end

                context "where we just have one entry and it is readble in the time" do
                    it "returns that entry " do
                    diary = Diary.new
                    diary_entry_1 = DiaryEntry.new("High Stakes", "272 Page_Count")
                    diary.add(diary_entry_1)
                    result = diary.find_best_entry_for_reading_time(2, 1)
                    expect(result).to eq diary_entry_1
                    end
                end
            end
    

            context "where we just have one entry and it is readble in the time" do
                it "returns nil " do
                diary = Diary.new
                diary_entry_1 = DiaryEntry.new("High Stakes", "Total Page Count 272")
                diary.add(diary_entry_1)
                result = diary.find_best_entry_for_reading_time(2, 1)
                expect(result).to eq nil
                end
            end

            context "where we have multiple entries" do
                it "returns the longest entry the user could read in this time" do
                diary = Diary.new
                best_entry = DiaryEntry.new("High Stakes", "272 Page_Count")
                diary.add(DiaryEntry.new("High Stakes", "272"))
                diary.add(best_entry)
                diary.add(DiaryEntry.new("High Stakes", "272 Page Count"))
                diary.add(DiaryEntry.new("High Stakes", "272 Page Count so_far"))
                result = diary.find_best_entry_for_reading_time(2, 1)
                expect(result).to eq best_entry
                end
            end        

  end