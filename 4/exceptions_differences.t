use strict;
use warnings;

use Test::More;
use Test::Exception;
use Test::Differences;

my $fh;
dies_ok {
    open($fh, "<", "not_there") or die "file missing";
} "opening bad file dies as expected";

lives_ok {
    open $fh, "<", "lorem_expected.txt" or die "missing file";
} "opening good file works";

my @lines = <$fh>;
my @unchanged = @lines;

@lines = map { s/am/ish/g; $_ } @lines;
@lines = grep { /et\b/ && $_ } @lines;

eq_or_diff \@lines, \@unchanged, 'find the diffs';


done_testing;

