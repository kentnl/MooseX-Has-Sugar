
use strict;
use warnings;

use Test::More tests => 8;    # last test to print
use Test::Exception;

{

    package TestPackage;
    use Moose;
    use MooseX::Has::Sugar::Minimal;

    has roattr => (
        isa      => 'Str',
        is       => ro,
        required => 1,
    );

    has rwattr => (
        isa      => 'Str',
        is       => rw,
        required => 1,
    );
    __PACKAGE__->meta->make_immutable;
}

pass("Syntax Compiles");

for ( {}, { roattr => "v" }, { rwattr => "v" } ) {
    dies_ok(
        sub {
            my $i = TestPackage->new( %{$_} );
        },
        'Constraints on requirements still work'
    );
}

lives_ok(
    sub {
        my $i = TestPackage->new( rwattr => 'v', roattr => 'v' );
    },
    'Construction still works'
);

my $i = TestPackage->new( rwattr => 'v', roattr => 'v' );

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

