#!perl -T

use Test::More tests => 1;

BEGIN {
	use_ok( 'MooseX::Has::Sugar' );
}

diag( "Testing MooseX::Has::Sugar $MooseX::Has::Sugar::VERSION, Perl $], $^X" );
