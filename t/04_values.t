use strict;
use warnings;

use Test::More tests => 12;    # last test to print
use FindBin;
use lib "$FindBin::Bin/lib";

use T4Values::TestCant;

use T4Values::AMinimal;

is_deeply( T4Values::AMinimal->ro_generated,   T4Values::AMinimal->ro_manual,   'Simple Expansion ro' );
is_deeply( T4Values::AMinimal->rw_generated,   T4Values::AMinimal->rw_manual,   'Simple Expansion rw' );
is_deeply( T4Values::AMinimal->bare_generated, T4Values::AMinimal->bare_manual, 'Simple Expansion bare' );

can_unok( 'T4Values::AMinimal', qw( ro rw required lazy lazy_build coerce weak_ref auto_deref ) );

use T4Values::BDeclare;

is_deeply( T4Values::BDeclare->generated, T4Values::BDeclare->manual, 'Attr Expansion' );

can_unok( 'T4Values::BDeclare', qw( ro rw required lazy lazy_build coerce weak_ref auto_deref ) );

use T4Values::CDeclareRo;

is_deeply( T4Values::CDeclareRo->generated, T4Values::CDeclareRo->manual, 'is Attr Expansion' );

can_unok( 'T4Values::CDeclareRo', qw( ro rw required lazy lazy_build coerce weak_ref auto_deref ) );

use T4Values::DEverything;

is_deeply( T4Values::DEverything->generated, T4Values::DEverything->manual, 'All Attr Expansion' );

can_unok( 'T4Values::DEverything', qw( ro rw required lazy lazy_build coerce weak_ref auto_deref ) );

use T4Values::EMixed;

is_deeply( T4Values::EMixed->generated, T4Values::EMixed->manual, 'Mixed Attr Expansion' );

can_unok( 'T4Values::EMixed', qw( ro rw required lazy lazy_build coerce weak_ref auto_deref ) );

