#!/usr/bin/perl
use strict;
use warnings;

use Test::Simple tests=>2;

my $four = 2 + 2;
ok($four, 'got an answer');
ok($four == 4, 'right answer');
