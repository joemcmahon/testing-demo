use strict;
use warnings;
use Test::More;

for (0..5) { sleep int($_/2); pass "slow $_"; }
done_testing;
