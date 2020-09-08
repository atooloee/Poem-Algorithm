I used a term frequency–inverse document frequency (tf-idf) algorithm. 
Tf-idf is a popular tool used by search engines to rank documents. 
Tf-idf is useful because it values unique words highly and dicounts 
common words. As long as the user remembers at least one unique word, 
we should be able to determine the correct line. 

For example let's take a look at the given input, "his head a flag".
Using out tf-idf formula we get the following results:

tf-idf("flag", "lepanto.txt") = 
tf-idf("a", "lepanto.txt") = 

Implementation

1. Document Processing
    - iterate through each line of the poem
    - store the line in an array
    - count the total number of words in the line, update document total
    - Create a hash where each word maps to an array of all lines in which
    it appears
    - Assign each word a uniqueness score by dividing 
    the total number of words in the document by the instances 
    of the given word

2. Analyzing User Input
    - get the user input
    - check that it has valid characters
    - get the lines where each word in the input appears
    - assign each of these lines a relevance score by taking the product
    of all the scores assigned to the words found in that line 
    - output the line with the highest relevance score
