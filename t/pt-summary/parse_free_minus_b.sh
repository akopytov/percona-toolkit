#!/bin/bash

TESTS=1
TMPDIR=$TEST_TMPDIR

cat <<EOF > $TMPDIR/expected
       Total | 3.89G
        Free | 1.42G
        Used | physical = 2.47G, swap = 0.00k, virtual = 2.47G
     Buffers | 131.84M
      Caches | 1.92G
       Dirty | 60 kB
EOF

cat <<EOF > $TMPDIR/in
             total       used       free     shared    buffers     cached
Mem:    4182048768 2653696000 1528352768          0  138240000 2060787712
-/+ buffers/cache:  454668288 3727380480
Swap:   5284814848          0 5284814848
MemTotal:        4084040 kB
MemFree:         2390720 kB
Buffers:          121868 kB
Cached:          1155116 kB
SwapCached:            0 kB
Active:           579712 kB
Inactive:         941436 kB
Active(anon):     244720 kB
Inactive(anon):    40572 kB
Active(file):     334992 kB
Inactive(file):   900864 kB
Unevictable:          48 kB
Mlocked:              48 kB
HighTotal:       3251848 kB
HighFree:        1837740 kB
LowTotal:         832192 kB
LowFree:          552980 kB
SwapTotal:       5144572 kB
SwapFree:        5144572 kB
Dirty:                60 kB
Writeback:             0 kB
AnonPages:        244264 kB
Mapped:            84452 kB
Shmem:             41140 kB
Slab:             133548 kB
SReclaimable:     107672 kB
SUnreclaim:        25876 kB
KernelStack:        2264 kB
PageTables:         7740 kB
NFS_Unstable:          0 kB
Bounce:                0 kB
WritebackTmp:          0 kB
CommitLimit:     7186592 kB
Committed_AS:    1192140 kB
VmallocTotal:     122880 kB
VmallocUsed:       32276 kB
VmallocChunk:      65120 kB
HardwareCorrupted:     0 kB
HugePages_Total:       0
HugePages_Free:        0
HugePages_Rsvd:        0
HugePages_Surp:        0
Hugepagesize:       2048 kB
DirectMap4k:       10232 kB
DirectMap2M:      897024 kB
EOF
parse_free_minus_b $TMPDIR/in > $TMPDIR/got
no_diff $TMPDIR/got $TMPDIR/expected
