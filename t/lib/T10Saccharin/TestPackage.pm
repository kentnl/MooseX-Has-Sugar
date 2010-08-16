package T10Saccharin::TestPackage;

# $Id:$
use strict;
use warnings;
use Moose;
use namespace::autoclean;

use MooseX::Has::Sugar::Saccharin;
use MooseX::Types::Moose qw( :all );

has roattr => required ro Str;

has rwattr => required rw Str;


__PACKAGE__->meta->make_immutable;

1;

