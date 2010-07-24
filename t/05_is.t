
use strict;
use warnings;

use Test::More tests => 9;    # last test to print
use Test::Exception;
use FindBin;
use lib "$FindBin::Bin/lib";

use T5Is::TestPackage;

sub cr {
  return T5Is::TestPackage->new(@_);
}

pass("Syntax Compiles");

for ( {}, { roattr => "v" }, { rwattr => "v" }, { bareattr => 'v' }, ) {
  dies_ok( sub { cr( %{$_} ) }, 'Constraints on requirements still work' );
}

lives_ok( sub { cr( rwattr => 'v', roattr => 'v', bareattr => 'v', ) }, 'Construction still works' );

my $i = cr( rwattr => 'v', roattr => 'v', bareattr => 'v', );

dies_ok( sub { $i->roattr('x') }, "RO works still" );

lives_ok( sub { $i->rwattr('x') }, 'RW works still' );

is( $i->rwattr(), 'x', "RW Works as expected" );

