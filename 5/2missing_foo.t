use strict;
use warnings;

use Test::More;
use Test::Warnings qw(:all);

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
    $n = $n + 0;
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
$object->run();

# Prints output we do not test.
$object->run(4);

done_testing;
