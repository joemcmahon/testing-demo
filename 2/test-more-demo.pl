#!/usr/bin/perl
use strict;
use warnings;

use Test::More;
use LWP::Simple;
use WWW::Mechanize;
use Data::Dumper;

my $four = 2 + 2;

ok $four, 'we got an answer';

BAIL_OUT('Bad environment, stopping tests')
    if $ENV{FAIL_HORRIBLY};

is $four, 4, "it's four";
is $four, 3, "it's not three";
isnt $four, 5, "it's not five";

like $four, qr/\A\d\Z/, 'exactly one digit';
unlike $four, qr/\d{2,}/, 'not two or more digits';

my $expected = { a=>1, b=>2, c=>3 };
my @letters = qw(a b c);
my $got = {};
while (@letters) {
    my $index = scalar @letters;
    my $letter = pop @letters;
    $got->{$letter} = $index;
}

is_deeply $got, $expected, 'letter mapping is right';
note Dumper($got);

can_ok('LWP::Simple', 'get');
my $mech = WWW::Mechanize->new();
isa_ok($mech, 'LWP::UserAgent');

fail("that trick never works");
pass("this time for sure!");

SKIP: {
    skip 'optional tests turned off', 2 unless $ENV{OPTIONAL};
    pass 'run this one...';
    pass '...and this one when optional is on';
}

TODO: {
    local $TODO = 'redefine the basis of mathematics';
    is 1, 0, "You fools! I have broken mathematics!";
}

diag "this always shows up";
note "this only shows up with --verbose on";
done_testing;
