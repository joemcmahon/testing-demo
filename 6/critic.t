use strict;
use warnings;
use Test::More;
use Test::Perl::Critic(severity => 1);
critic_ok('bad_example.pl');
done_testing;
