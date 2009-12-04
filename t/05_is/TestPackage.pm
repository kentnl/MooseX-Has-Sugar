package TestPackage;
our $VERSION = '0.0405';



# $Id:$
use strict;
use warnings;
use Moose;
use namespace::autoclean;

use MooseX::Has::Sugar::Minimal;

has roattr => ( isa => 'Str', is => ro, required => 1, );

has rwattr => ( isa => 'Str', is => rw, required => 1, );

has bareattr => ( isa => 'Str', is => bare, required => 1, );

__PACKAGE__->meta->make_immutable;

1;

