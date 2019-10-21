readfq.v8_meta
====
Program: readfq - raw data process pipeline  
Updated: v8_meta (Mar 17 2014, 11:07:04)  
Modify: lsq  
readfq.v8_meta is a software dedicated to the fast and accurate quality control of FastQ files. This tool is developed in C  

Outline
===
* Installation  
* input and output  
* filtering  
    * quality filter    
    * N filter  
    * adpter filter  
    * duplications filter    
* trimming  
* all options  

# Installation

    git clone  
    #readfq.v8_meta can be used only for Linux systems  
    #readfq.v8_meta does not require installation to run directly  

# input and output

>readfq.v8_meta only supports  paired-end (PE) input/output,read can be gzip format  
>* input has been recorded in a read.list,can be specified by -f  
>* read1 output and read2 output can be specified respectively by -3,-4 or --q3,--q4  
>* <read.list> example:  
>>raw.read_1.fq.gz,raw.read_2.fq.gz raw.read_1.adp.list,raw.read_2.adp.list  
>>raw.read_1.fq.gz,raw.read_2.fq.gz  

    readfq.v8_meta -f read.list -3 out.fq1 -4 out.fq2  
>>you can specify the output gzip format by -z  

    readfq.v8_meta -f read.list -3 out.fq1.gz -4 out.fq2.gz -z  
>>you can specify  the output data size by -o  

    readfq.v8_meta -f read.list -3 out.fq1.gz -4 out.fq2.gz -z -o 6000  
    #-o 6000 means the size is 6G  

# filtering

## quality filter  
>you can specify -q or --qual to filter low quality read  
>* `-q QUAL,CONT` or `--qual QUAL,CONT`  
>>QUAL the quality value that a base is qualified  
>>CONT how many bases are allowed to be unqualified. Default 40bp  

    readfq.v8_meta -f read.list -3 out.fq1.gz -4 out.fq2.gz -z -o 6000 -q 38,40   
    #-q 38,40  remove the reads with more than 40 low-quality bases (Q-value < 38)    
## N filter  
>you can specify -n or --nnum to filter N's read  

    readfq.v8_meta -f read.list -3 out.fq1.gz -4 out.fq2.gz -z -o 6000 -n 10  
    #-n 10 remove the reads with more than 10 bases which is N  
    
## adpter filter  
>you can specify -l to filter reads which has more than a certain overlap with adpter  

    readfq.v8_meta -f read.list -3 out.fq1.gz -4 out.fq2.gz -z -o 6000 -l 15  
    #-l 15 remove the reads which has more than 15bp's overlap with adpter  
    
## duplications filter  
>you can specify -d or --dup  to filter duplications and also can specify -D or --DUP to get duplications reads  

    readfq.v8_meta -f read.list -3 out.fq1.gz -4 out.fq2.gz -z -o 6000 -d -D duplications.fq.gz  

# trimming  
>you can specify --t or --trim to trim tail low quality bases,default 35  

    readfq.v8_meta -f read.list -3 out.fq1.gz -4 out.fq2.gz -z -o 6000 --t 35  

# all options  

    Usage: readfq.v8_meta -f <read.list> -P ** [OPTIONS]
    Options:
      *-f,--flist read.list   input raw reads list file, read can be gzip format
       -P,--Prefix prefix     output read's prefix [output]
       -3,--q3 out_1.fq       output 1st reads, has higher priority than -P
       -4,--q4 out_2.fq       output 2nd reads, has higher priority than -P
       -L,--Lowq              output low quality reads
       -S,--Sing              output single good reads
       -R,--Raw               output raw data corresponding to clean data
       -D,--DUP               output duplication data if -d (--dup)
       -z,--gz                output as gzip format
       -o,--size INT          only output INT Mbp reads
       ...
       -c,--c1 BEG,END        chomp 1st reads by (BEG,END)
       -C,--c2 BEG,END        chomp 2nd reads by (BEG,END)
       -q,--qual QUAL,CONT    filter out low quality reads, (bgi)'B'<->66, (novogene)'B'<->35
       -n,--nnum INT          filter out many 'N's reads
       -t,--trim QUAL         trim tail low quality bases, (bgi)'B'<->66, (novogene)'B'<->35
       -l,--alen INT          cut-off adapter align length [15]
       -m,--amis INT          cut-off adapter mis-match bases [3]
       -p,--poly STR,CONT     filter poly reads, "STR" can be "ATGC"
       -d,--dup               filter duplications
       ...
       -v,--version           show version information && exit
       -h,--help              this help message

    *  required argument
    [] means for default value
    <read.list> example:
     raw.read_1.fq.gz,raw.read_2.fq.gz raw.read_1.adp.list,raw.read_2.adp.list
     raw.read_1.fq.gz,raw.read_2.fq.gz
