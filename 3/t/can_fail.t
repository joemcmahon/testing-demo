use strict;
use warnings;

use Test::More tests=>1;

my $value = $ENV{FORCE_FAILURE} ? 2 : 1;

is $value, 1, 'this sometimes fails';
