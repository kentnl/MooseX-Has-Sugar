package TestCant;
our $VERSION = '0.0405';



# $Id:$
use strict;
use warnings;
use Test::More    ();
use Sub::Exporter ();
use namespace::autoclean;

Sub::Exporter::setup_exporter(
    {
        exports => ['can_unok'],
        groups  => { default => ['can_unok'] },
    }
);

# Sniped from Test::More;
sub can_unok($@) {
    my ( $proto, @methods ) = @_;
    my $class = ref $proto || $proto;
    my $tb = Test::More->builder;

    unless ($class) {
        my $ok = $tb->ok( 0, "! ->can(...)" );
        $tb->diag('    can_unok() called with empty class or reference');
        return $ok;
    }

    unless (@methods) {
        my $ok = $tb->ok( 0, "$class->can(...)" );
        $tb->diag('    can_unok() called with no methods');
        return $ok;
    }

    my @nok = ();
    foreach my $method (@methods) {
        $tb->_try( sub { !$proto->can($method) } ) or push @nok, $method;
    }

    my $name =
      ( @methods == 1 )
      ? "!$class->can('$methods[0]')"
      : "!$class->can(...)";

    my $ok = $tb->ok( !@nok, $name );

    $tb->diag( map "    !$class->can('$_') failed\n", @nok );

    return $ok;
}

1;

