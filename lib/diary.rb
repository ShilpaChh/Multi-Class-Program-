# # File: lib/diary.rb
# # e.g. 2 of Multi-Class Program

class Diary
    def initialize
        @entries = []
    end
  
    def add(entry) 
      @entries << entry
    end
  
    def all
      return @entries
    end
  
    def count_words
      return @entries.sum(&:count_words)
    end
  
    def reading_time(wpm)
        fail "WPM must be positive." unless wpm.positive?
        return (count_words / wpm.to_f).ceil
    end
  
    def find_best_entry_for_reading_time(wpm, minutes)
      return readable_entries(wpm, minutes).max_by(&:count_words)
    end

  private
    def readable_entries(wpm, minutes)
      return @entries.filter do |entry| entry.reading_time(wpm) <= minutes
        end
    end
        
end
  

# # # File: lib/diary.rb
# # # e.g. 2 of Multi-Class Program

# class Diary
#   def initialize
#       @entries = []
#   end

#   def add(entry) # entry is an instance of DiaryEntry
#     # Returns nothing
#     @entries << entry
#   end

#   def all
#     # Returns a list of instances of DiaryEntry
#     return @entries
#   end

#   def count_words
#     # Returns the number of words in all diary entries
#     # HINT: This method should make use of the `count_words` method on DiaryEntry.
#   #   return @entries.map do |entry|
#   #     entry.count_words
#   #   end.sum # without sum, it gives us the list .. expected: 4 and got: [2, 2], so we have .sum to get it right
#     ## or else the below method to refactor it by calling method of each list by the following syntax
#     return @entries.sum(&:count_words)

#   end

#   def reading_time(wpm) # wpm is an integer representing
#                         # the number of words the user can read per minute
#     # Returns an integer representing an estimate of the reading time in minutes
#     # if the user were to read all entries in the diary.
#   #   return @entries.sum do |entry|
#   #   entry.reading_time(wpm)
#   #   end
#   #   instead of reading_time on entry (above three lines) we should rely on word count. 
#   #   This is because have  unit can't catch but integration test can catch the rounding error -> expected 3 got 4 for context "Reading time behaviour"
#   #   So, matching the reading_time(wpm) method of diary_entry.
#       fail "WPM must be positive." unless wpm.positive?
#       return (count_words / wpm.to_f).ceil
#   end

#   #### def find_best_entry_for_reading_time(wpm, minutes)
#         # `wpm` is an integer representing the number of words the user can read
#         # per minute.
#         # `minutes` is an integer representing the number of minutes the user
#         # has to read.
#     # Returns an instance of diary entry representing the entry that is closest 
#     # to, but not over, the length that the user could read in the minutes they
#     # have available given their reading speed.
#       ## return @entries.first # to return the first entry
#       ## this results in failed test as content is unreadbale in the reading time.
#       # Failure/Error: expect(result).to eq nil
#       ## expected: nil
#       ## got: #<DiaryEntry:0x0000000127350548 @title="High Stakes", @contents="Total Page Count 272">, so have this instead:

#       ### readable_entries = @entries.filter do |entry| entry.reading_time(wpm) <= minutes
#       ### end 
#       # return readable_entries.first 
#           # .first as we need the first one and not the list 

#           # ## to cater to => context "where we have multiple entries" do
#           # sorted_by_longest = readable_entries.sort_by do |entry| entry.count_words
#           # end
#           # sorted_by_longest.last
          
#           ### refactor it by following steps:
#           ## instead of sorting and then getting teh last_one, we can use the max_by function to count the max words:
#       # ###     readable_entries(wpm, minutes).max_by do |entry| entry.count_words
#       # ###    end
#       # ### end

#       # line 58 this part, @entries.filter do |entry| entry.reading_time(wpm) <= minutes, can be extracted in a private method, as below and then chane in line 69

#       # so, finally as alll tests passed, we can further refactor/shorten it as:

#       def find_best_entry_for_reading_time(wpm, minutes)

#           return readable_entries(wpm, minutes).max_by(&:count_words)

#       end


#       private

#       def readable_entries(wpm, minutes)
#           return @entries.filter do |entry| entry.reading_time(wpm) <= minutes
#           end
#       end
      
# end
