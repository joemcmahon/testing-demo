use strict;
use warnings;
use Test::More;

for (0..8) { sleep 1; pass "medium $_"; }
done_testing;
