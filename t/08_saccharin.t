
use strict;
use warnings;

use Test::More tests => 7;    # last test to print
use Test::Exception;
use Find::Lib './08_saccharin';

use TestPackage;

sub cr {
    return TestPackage->new();
}

pass("Syntax Compiles");

lives_ok( sub { cr() }, 'Construction still works' );

my $i = cr();

is( $i->roattr, 'y', 'Builders Still Trigger 1' );
is( $i->rwattr, 'y', 'Builders Still Trigger 2' );

dies_ok( sub { $i->roattr('x') }, "RO works still" );

lives_ok( sub { $i->rwattr('x') }, 'RW works still' );

is( $i->rwattr(), 'x', "RW Works as expected" );

