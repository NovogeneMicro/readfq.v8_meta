mkdir ./output
cd output/
../../readfq.v8_meta -z -q  38,40  -n  10 -l 15 -o 100 -f ../read.list -3 test_fq1 -4 test_fq2 1>test.out.stat 2>test.out.err
