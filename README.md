I used a term frequency–inverse document frequency (tf-idf) algorithm. 
Tf-idf is a popular tool used by search engines to rank documents. 
Tf-idf is useful because it values unique words highly and dicounts 
common words. As long as the user remembers at least one unique word, 
we should be able to determine the correct line. 

Implementation

1. Read File
    - iterate through each line of the poem
    - store the line in an array
    - count the total number of words in the line, update document total
    - Create a hash where each word maps to an array of all lines in which
    it appears
    - Assign each word a uniqueness score by dividing 
    the total number of words in the document by the instances 
    of the given word

2. Find Best Match
    - get the user input
    - get the lines where each word in the input appears
    - assign each of these lines a relevance score by taking the product
    of all the scores assigned to the input words found in that line 
    - output the line with the highest relevance score

3. Instructions on How to Run (Assuming you have Ruby)
    - fork and clone the repo to your local machine
    - navigate to the project root directory in your terminal 
    - enter `bundle install` in the terminal 
    - if that does not work, run `gem install bundler` and try again 
    - enter `ruby bin/run.rb` in the terminal 
    - enter the words from a line you remember 

If you do not have Ruby you can download it here: https://www.ruby-lang.org/en/downloads/

