!/bin/bash

#concatenation
echo "demonstrating concatenation"
a="This is a sample string"
b="This is another string"
echo "value of a is $a"
echo "value of b is $b"
echo "concatenating the two strings into a third variable c"
c="$a $b"
echo "result is '$c'"
echo


#length
echo "demonstrating string length"
echo "length of a is ${#a}"
echo "length of b is ${#b}"
echo "length of c is ${#c}"
echo


#contains
echo "demonstrating how to check if a string contains a given word"
#contains a string litereal
testString="The quick brown fox jumped over the lazy dog"
word="Bbrown"
echo "string is $testString"
echo "check if testString contains $word"
if [[ $testString == *"$word"*  ]]; then
  echo "yes, testString contains '$word' in it"
else
  echo "no, testString does not contain '$word' in it"
fi
#http://stackoverflow.com/questions/229551/string-contains-in-bash
echo "NOTE: if [[ '\$var' == *\"myst\"* ]] checks for contains.. can convert to  not contains by adding ! in begining of if condition"
echo "NOTE: if literal contains in not enough, this: if [[ \$string =~ \"My s\" ]] can check for contains using regEx"
echo



#substring
echo "demonstrating substring"
bigString=encyclopedia
echo "bigString is $bigString"
startIndex=0
reqLength=3
sub=${bigString:startIndex:reqLength}
echo "substring of $bigString from index $startIndex and length $reqLength is $sub"
echo



