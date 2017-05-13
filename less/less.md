**Less**
----

Less is similar to more command, but less allows both forward and backward movements. Moreover, less don’t require to load the whole file before viewing. Try opening a large log file in Vim editor and less — you’ll see the speed difference.

Once you’ve opened a file using less, following keys can be used to search

**Forward Search**

    / – search for a pattern which will take you to the next occurrence.
    n – for next match in forward
    N – for previous match in backward
    
  **Backward Search**
  

      ? – search for a pattern which will take you to the previous occurrence.
        n – for next match in backward direction
        N – for previous match in forward direction


**Screen Navigation**
CTRL+F – forward one window
CTRL+B – backward one window
CTRL+D – forward half window
CTRL+U – backward half window
j – navigate forward by one line
k – navigate backward by one line
G – go to the end of file
g – go to the start of file
q or ZZ – exit the less pager
10j – 10 lines forward.
10k – 10 lines backward.
CTRL+G – show the current file name along with line, byte and percentage statistics.

**Less Command – Viewing multiple files**

*Method 1:*  You can open multiple files by passing the file names as arguments.

    $ less file1 file2

Method 2: While you are viewing file1, use :e to open the file2 as shown below.

    $ less file1
    :e file2

Navigation across files: When you opened more than two files ( for e.g – less * ), use the following keys to navigate between files.

    :n – go to the next file.
    :p – go to the previous file.