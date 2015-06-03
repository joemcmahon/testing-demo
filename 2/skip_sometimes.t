use strict;
use warnings;

use Test::More;

plan skip_all =>'optional tests off'
    unless ($ENV{OPTIONAL});

pass "Hi! I'm optional!";

done_testing;
