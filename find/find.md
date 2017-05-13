**find command**
============
    $ find #searches in the current directory
    
   above command is same as 

    $ find .
    $ find . -print
for searching in a specific directory:    

    $ find ./test #searches in the given directory
for searching by file name

     $ find ~/test/ -name abcd.txt
-iname for case insensitive searching
-maxdepth to specify the depth of directories find will have to traverse
-not to negate the searching condition ( ! can also be used)
-type to filter by file type

find can work with multiple conditions, like : 

    $ find ./test -name 'abc*' ! -name '*.php'

When using multiple name criterias, the find command would combine them with AND operator, which means that only those files which satisfy all criterias will be matched. However if we need to perform an OR based matching then the find command has the "o" switch.

     find -name '*.php' -o -name '*.txt'

Search multiple directories together

    find ./test ./dir2 -type f -name "abc*"

searching by permissions

    $ find . -type f -perm 0664
    $ find / -maxdepth 2 -perm /u=s 2>/dev/null
    $ find /etc -maxdepth 1 -perm /u=r

Search Files Based On Owners and Groups

    $ find . -user bob
    $ find /var/www -group developer
Based on time

    find / -mtime 50 #modified exactly 50 days back
    find / -mtime +50 –mtime -100  #modified b/w 50 to 100 days
    find /home/bob -cmin -60 #changed in last N minutes.
    find / -size +50M -size -100M #Find files in a size range