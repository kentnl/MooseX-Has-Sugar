package TestPackage;

# $Id:$
use strict;
use warnings;
use Moose;
use namespace::autoclean;

use MooseX::Has::Sugar;

has roattr => ( isa => 'Str', is => 'ro', required, );

has rwattr => ( isa => 'Str', is => 'rw', required, );

__PACKAGE__->meta->make_immutable;

1;
