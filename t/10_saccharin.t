
use strict;
use warnings;

use Test::More tests => 6;    # last test to print
use Test::Exception;
use FindBin;
use lib "$FindBin::Bin/lib";

use T10Saccharin::TestPackage;

sub cr {
  return T10Saccharin::TestPackage->new(roattr => 'y', rwattr => 'y');
}

pass("Syntax Compiles");

lives_ok( sub { cr() }, 'Construction still works' );

my $i = cr();

is( $i->roattr, 'y', 'Correctly initialized' );

dies_ok( sub { $i->roattr('x') }, "RO works still" );

lives_ok( sub { $i->rwattr('x') }, 'RW works still' );

is( $i->rwattr(), 'x', "RW Works as expected" );

