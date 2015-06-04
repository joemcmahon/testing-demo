use strict;
use warnings;

use Test::More;
use Test::Warnings qw(:all);
use Test::Output;

package Sample;

sub new {
    my($class, $params_ref) = @_;
    $class->validate($params_ref);
    bless $params_ref, $class;
}

sub validate {
    die "unimplemented";
}

sub run {
    my($self, $n) = @_;
    $n =  0 + ($n // 0);
    print $self->foo x $n, "\n";
}

sub foo {
    my($self) = @_;
    return $self->{foo};
}

package main;

{
    # Block warning for sub redefinition.
    no warnings 'redefine';
    *Sample::validate = sub {
        my($class, $ref) = @_;
        die unless ref $ref eq 'HASH';
        warn "missing foo parameter" unless $ref->{foo};
    };
}

# Throws a warning.
my $object;
my $warning = warning { $object = Sample->new({}) };
ok $object, 'got an object';
like $warning, qr/missing foo/, 'expected warning there';

# No warning this time.
$object = Sample->new( { foo => 'beep! ' } );
ok $object, 'got an object';

# Prints (no) output which we do not test,
# and a warning.
my @warnings = warnings { stdout_is( sub { $object->run() }, "\n", 'nothing printed' ) };
is @warnings, 0, 'got no warnings as expected';

# Prints output we do not test.
stdout_is( sub { $object->run(4); }, "beep! beep! beep! beep! \n", 'four beeps');

done_testing;
