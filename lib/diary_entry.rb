# # File: lib/diary_entry.rb
# # e.g. 2 of Multi-Class Program


class DiaryEntry
    def initialize(title, contents) # title, contents are strings
        # ...
        @title = title
        @contents = contents
    end

    def title
        # Returns the title as a string
        return @title
    end

    def contents
        # Returns the contents as a string
        return @contents
    end

    def count_words
        # Returns the number of words in the contents as an integer
        # return @contents.split(" ").length 
        # split to count the words separated by spaces in the diary_entry_spec 'Count_words' context and then find the length. This can be more long n tedous if the list is long.
        # so, another way is to do the count as below as it's more efficient in terms of performance
        return 0 if @contents.empty? ## to take into account when there are no contents as is diary_entry_spec context "if no contents"
        return @contents.count(" ") + 1
        ## we used count as words are always separted by spaces. so we are counting spaces and then adding 1 to count the words to return exact words.
        ## in the diary_entry_spec 'Count_words' context we have 4 spaces and 5 words in total

    end

    def reading_time(wpm) # wpm is an integer representing
                            # the number of words the user can read per minute
        # Returns an integer representing an estimate of the reading time in minutes
        # for the contents at the given wpm.
        fail "WPM must be positive." unless wpm.positive? # reading 2 words per min
        return (count_words / wpm.to_f).ceil
    end

    def reading_chunk(wpm, minutes) # `wpm` is an integer representing the number
                                    # of words the user can read per minute
                                    # `minutes` is an integer representing the
                                    # number of minutes the user has to read
        # Returns a string with a chunk of the contents that the user could read
        # in the given number of minutes.
        # If called again, `reading_chunk` should return the next chunk, skipping
        # what has already been read, until the contents is fully read.
        # The next call after that it should restart from the beginning.

        ## refer earlier code in previous eg
    end
end