package T7AttrLazyBuild::TestPackage;

# $Id:$
use strict;
use warnings;
use Moose;
use namespace::autoclean;

use MooseX::Has::Sugar;

has roattr => ( isa => 'Str', is => 'ro', lazy_build, );

has rwattr => ( isa => 'Str', is => 'rw', lazy_build, );

sub _build_rwattr {
    return 'y';
}

sub _build_roattr {
    return 'y';
}

__PACKAGE__->meta->make_immutable;

1;

