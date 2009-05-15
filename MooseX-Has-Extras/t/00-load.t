#!perl -T

use Test::More tests => 1;

BEGIN {
	use_ok( 'MooseX::Has::Extras' );
}

diag( "Testing MooseX::Has::Extras $MooseX::Has::Extras::VERSION, Perl $], $^X" );
