package TestPackage;
our $VERSION = '0.0405';



# $Id:$
use strict;
use warnings;
use Moose;
use namespace::autoclean;

use MooseX::Has::Sugar::Saccharin;
use MooseX::Types::Moose (':all');

has roattr => lazy_build ro Str;

has rwattr => lazy_build rw Str;

sub _build_rwattr {
  return 'y';
}

sub _build_roattr {
  return 'y';
}

__PACKAGE__->meta->make_immutable;

1;

