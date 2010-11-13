
use strict;
use warnings;

use Test::More;
use Test::Fatal;
use lib "t/lib";

use T6AttrRequired::TestPackage;

pass("Syntax Compiles");

sub cr { return T6AttrRequired::TestPackage->new(@_) }

for ( {}, { roattr => "v" }, { rwattr => "v" }, { bareattr => 'v' } ) {
  isnt( exception { cr( %{$_} ) }, undef, 'Constraints on requirements still work' );
}

is( exception { cr( rwattr => 'v', roattr => 'v', bareattr => 'v', ) }, undef, 'Construction still works' );

my $i = cr( rwattr => 'v', roattr => 'v', bareattr => 'v', );

isnt( exception { $i->roattr('x') }, undef, "RO works still" );

is( exception { $i->rwattr('x') }, undef, 'RW works still' );

is( $i->rwattr(), 'x', "RW Works as expected" );

done_testing;
