use strict;
use warnings;

use Test::More tests => 12;    # last test to print
use Find::Lib './04_values';
use TestCant;

use AMinimal;

is_deeply( AMinimal->ro_generated, AMinimal->ro_manual, 'Simple Expansion ro' );
is_deeply( AMinimal->rw_generated, AMinimal->rw_manual, 'Simple Expansion rw' );
is_deeply( AMinimal->bare_generated, AMinimal->bare_manual, 'Simple Expansion bare' );


can_unok( 'AMinimal', qw( ro rw required lazy lazy_build coerce weak_ref auto_deref ) );

use BDeclare;

is_deeply( BDeclare->generated, BDeclare->manual, 'Attr Expansion' );

can_unok( 'BDeclare', qw( ro rw required lazy lazy_build coerce weak_ref auto_deref ) );

use CDeclareRo;

is_deeply( CDeclareRo->generated, CDeclareRo->manual, 'is Attr Expansion' );

can_unok( 'CDeclareRo', qw( ro rw required lazy lazy_build coerce weak_ref auto_deref ) );

use DEverything;

is_deeply( DEverything->generated, DEverything->manual, 'All Attr Expansion' );

can_unok( 'DEverything', qw( ro rw required lazy lazy_build coerce weak_ref auto_deref ) );

use EMixed;

is_deeply( EMixed->generated, EMixed->manual, 'Mixed Attr Expansion' );

can_unok( 'EMixed', qw( ro rw required lazy lazy_build coerce weak_ref auto_deref ) );

