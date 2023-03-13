require "diary_entry"

RSpec.describe DiaryEntry do

    context "set the initial test to test title and contents methods of DiaryEntry class" do
        it "contructs initial title and contents" do
            diary_entry = DiaryEntry.new("High Stakes", "272 Page_Count")
            expect(diary_entry.title).to eq "High Stakes"
            expect(diary_entry.contents).to eq "272 Page_Count"
        end 
    end

    context "if no contents" do
        it "returns zero if contents are empty" do
            diary_entry = DiaryEntry.new("High Stakes", "")
            expect(diary_entry.count_words).to eq 0
        end 
    end

    context "if one word in contents" do
        it "returns one if content is one word" do
            diary_entry = DiaryEntry.new("High Stakes", "Read")
            expect(diary_entry.count_words).to eq 1
        end 
    end

    context "count words" do
        it "count words written in the below line in contents" do
            diary_entry = DiaryEntry.new("High Stakes", "Read pages 1 till 47")
            expect(diary_entry.count_words).to eq 5
        end 
    end

    context "count words when read more" do
        it "count words written in the below line in contents" do
            diary_entry = DiaryEntry.new("High Stakes", "counting words when read further than 47")
            expect(diary_entry.count_words).to eq 7
        end 
    end

    context "count words when read more" do
        it "fails if the wpm is zero" do
            diary_entry = DiaryEntry.new("High Stakes", "non matching words")
            expect { diary_entry.reading_time(0) }.to raise_error "WPM must be positive."
        end 
    end 

    context "reading time" do
        # Rememebr the case where wpm is 0
        it "returns zero if content is empty" do
            diary_entry = DiaryEntry.new("High Stakes", "")
            expect(diary_entry.reading_time(2)).to eq 0
        end 
    end

    context "reading time when its one word" do
        it "returns one if content is one word" do
            diary_entry = DiaryEntry.new("High Stakes", "Read")
            expect(diary_entry.reading_time(2)).to eq 1
        end 
    end

    context "reading time for all the listed contents" do
        it "returns the reading time for the contents" do
            diary_entry = DiaryEntry.new("High Stakes", "Read pages further than 47")
            expect(diary_entry.reading_time(2)).to eq 3 # its 2 wpm and these are 5 words n we get 2.5. So we are rounding it off to 3
        end 
    end


  end