#!/bin/bash

TESTS=1
TMPDIR=$TEST_TMPDIR

cat <<EOF > $TMPDIR/expected

  Command                        COUNT(*) Working SUM(Time) MAX(Time)
  ------------------------------ -------- ------- --------- ---------
  Binlog Dump                           1       1   9000000   9000000
  Connect                               2       2   6000000   5000000
  Query                                 2       2         0         0
  Sleep                               150       0    150000     20000

  User                           COUNT(*) Working SUM(Time) MAX(Time)
  ------------------------------ -------- ------- --------- ---------
  acjcxx                                4       0         0         0
  aecac                                 1       0         0         0
  babeecc                              20       0         0         0
  centous                               2       0         0         0
  crcpcpc                               2       0         0         0
  crgcp4c                               3       0         0         0
  eanecj                               30       1         0         0
  ebace                                10       0         0         0
  etace                                80       0         0         0
  goate                                 8       0         0         0
  qjveec                                1       0         0         0
  repl                                  1       1   9000000   9000000
  root                                  1       1         0         0
  system user                           2       2   6000000   5000000

  Host                           COUNT(*) Working SUM(Time) MAX(Time)
  ------------------------------ -------- ------- --------- ---------
  10.14.82.196                          6       0         0         0
  10.14.82.202                         20       0         0         0
  10.17.85.100                          9       0         0         0
  10.17.85.74                           1       1   9000000   9000000
  10.17.85.86                          35       0         0         0
  10.17.85.88                           5       0         0         0
  10.17.85.90                          10       0         0         0
  10.36.34.66                          35       1         0         0
                                        2       2   6000000   5000000
  localhost                             1       1         0         0
  someserver.woozle.com11               1       0         0         0
  someserver.woozle.com14               1       0         0         0
  someserver.woozle.com                40       0         0         0

  db                             COUNT(*) Working SUM(Time) MAX(Time)
  ------------------------------ -------- ------- --------- ---------
  aetecjc                             175       1         0         0
  NULL                                  4       4  15000000   9000000

  State                          COUNT(*) Working SUM(Time) MAX(Time)
  ------------------------------ -------- ------- --------- ---------
                                      150       0         0         0
  Has read all relay log; waitin        1       1    300000    300000
  Has sent all binlog to slave;         1       1   9000000   9000000
  NULL                                  2       2         0         0
  Waiting for master to send eve        1       1   5000000   5000000

EOF

summarize_processlist samples/processlist-001.txt > $TMPDIR/got
no_diff $TMPDIR/got $TMPDIR/expected
