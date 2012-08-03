
use strict;
use warnings;

use Test::More;
use Test::Fatal;
use lib "t/lib";

use T8Saccharin::TestPackage;

sub cr {
  return T8Saccharin::TestPackage->new();
}

pass("Syntax Compiles");

is( exception { cr() }, undef, 'Construction still works' );

my $i = cr();

is( $i->roattr, 'y', 'Builders Still Trigger 1' );
is( $i->rwattr, 'y', 'Builders Still Trigger 2' );

isnt( exception { $i->roattr('x') }, undef, "RO works still" );

is( exception { $i->rwattr('x') }, undef, 'RW works still' );

is( $i->rwattr(), 'x', "RW Works as expected" );

done_testing;
