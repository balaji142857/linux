**head and tail**
-------------

**tail**
	

> Tail By default “tail” prints the last 10 lines of a file, then exits.

example

    tail -n <number_of_lines> /path/to/file

We can  open multiple files using a single tail command

	tail -n <number of lines> <file1> <file2> <file3>

We can monitor the file as and when extra content is added to it after it is opened by tail using the -f option. Here f stands for follow the stream

    tail -f /path/to/file

> The same tail -f command can be replicated using less command well.
> First open the file with less and then once opened,  then press
> shift+f
>     `less /path/to/filename`


    	
We have other option -s  which should always be used with -f . It will determine the sleep interval, whereas tail -f will keep watching the file, the refresh rate is each 1 second

    tail -f -s <sleep interval in seconds> /path/to/file

In order to view a large file say /var/log/messages & that too we are only interested in the last certain number of bytes of data, the -c option can do this easily. 

    tail -c <number of bytes> /path/to/file

**head**
head is similar to tail, just that it prints the first n lines instead of the last n lines

    head -n <number_of_lines> /path/to/file 	