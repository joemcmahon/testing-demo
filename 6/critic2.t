use strict;
use warnings;
use Test::More;
use Test::Perl::Critic(severity => 1);
critic_ok('better.pl');
done_testing;
