# readfq.v8_meta
Program: readfq - raw data process pipeline
Updated: v8_meta (Mar 17 2014, 11:07:04)
Modify: lsq
readfq.v8_meta is a software dedicated to the fast and accurate quality control of FastQ files. This tool is developed in C 

Usage: readfq.v8_meta -f <read.list> -P ** [OPTIONS]
Options:
  *-f,--flist read.list   input raw reads list file, read can be gzip format
   -P,--Prefix prefix     output read's prefix [output]
   -3,--q3 out_1.fq       output 1st reads, has higher priority than -P
   -4,--q4 out_2.fq       output 2nd reads, has higher priority than -P
   -L,--Lowq              output low quality reads
   -S,--Sing              output single good reads
   -R,--Raw               output raw data corresponding to clean data
   -D,--DUP               output duplication data if -d(--dup)
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
