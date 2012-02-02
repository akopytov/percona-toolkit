#!/bin/bash

TESTS=2
TMPDIR=$TEST_TMPDIR

TEST_NAME="netstat-001.txt"
cat <<EOF > $TMPDIR/expected
  Connections from remote IP addresses
    192.168.243.72      1
    192.168.243.81      2
  Connections to local IP addresses
    192.168.243.71      3
  Connections to top 10 local ports
    3306                3
  States of connections
    ESTABLISHED         4
    LISTEN             15
EOF
parse_netstat samples/netstat-001.txt > $TMPDIR/got
no_diff $TMPDIR/got $TMPDIR/expected

TEST_NAME="netstat-003.txt"
cat <<EOF > $TMPDIR/expected
  Connections from remote IP addresses
    10.8.0.12           6
    10.8.0.14           2
    10.8.0.65           1
    10.8.0.76          25
    10.8.0.77           1
    192.168.5.77        2
  Connections to local IP addresses
    10.8.0.75          35
  Connections to top 10 local ports
    22                  1
    3306               25
    37570               1
    51071               1
    51072               1
    51073               1
    51074               1
    52300               1
    60757               1
  States of connections
    ESTABLISHED        30
    LISTEN              3
    TIME_WAIT           3
EOF
parse_netstat samples/netstat-003.txt > $TMPDIR/got
no_diff $TMPDIR/got $TMPDIR/expected
