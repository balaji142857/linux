**cut**
---

     -b by byte postion
     -c by character position
     --complement reverses the selction of fields


----------
*examples*

     echo 'baz' | cut -b 1-2
     ba

> Not all characters can be represented in a single byte. For example
> character ‘♣’ is three bytes. Hence use the -c switch

    echo '♣foobar' | cut -c 1,6
    ♣a

> __*names.csv*__ 
> John,Smith,34,London 
> Arthur,Evans,21,Newport 
> George,Jones,32,Truro

    cut -d ',' -f 1 names.csv
    John
    Arthur

Cut multiple columns using ',' and specify column range using '-'

    cut -d ',' -f 1,4 names.csv
    John,London
    Arthur,Newport
    George,Truro

