package AMinimal;

# $Id:$
use strict;
use warnings;

use Moose;
use MooseX::Has::Sugar::Minimal;
use namespace::autoclean;

sub ro_generated { { isa => 'Str', is => ro, } }

sub ro_manual { { isa => 'Str', is => 'ro', } }

sub rw_generated { { isa => 'Str', is => rw, } }

sub rw_manual { { isa => 'Str', is => 'rw', } }

sub bare_generated { { isa => 'Str', is => bare, } }

sub bare_manual { { isa => 'Str', is => 'bare', } }

__PACKAGE__->meta->make_immutable;
1;

