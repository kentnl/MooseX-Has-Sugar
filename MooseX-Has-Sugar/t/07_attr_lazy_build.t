
use strict;
use warnings;

use Test::More tests => 7;    # last test to print
use Test::Exception;

{

    package TestPackage;
    use Moose;
    use MooseX::Has::Sugar qw( :attrs );

    has roattr => (
        isa => 'Str',
        is  => 'ro',
        lazy_build,
    );

    has rwattr => (
        isa => 'Str',
        is  => 'rw',
        lazy_build,
    );

    sub _build_rwattr {
        return 'y';
    }

    sub _build_roattr {
        return 'y';
    }
    __PACKAGE__->meta->make_immutable;
}

pass("Syntax Compiles");

lives_ok(
    sub {
        my $i = TestPackage->new();
    },
    'Construction still works'
);

my $i = TestPackage->new();

is( $i->roattr, 'y', 'Builders Still Trigger 1' );
is( $i->rwattr, 'y', 'Builders Still Trigger 2' );

dies_ok(
    sub {
        $i->roattr('x');
    },
    "RO works still"
);

lives_ok(
    sub {
        $i->rwattr('x');
    },
    'RW works still'
);

is( $i->rwattr(), 'x', "RW Works as expected" );

