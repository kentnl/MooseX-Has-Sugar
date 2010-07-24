package  T4Values::CDeclareRo;

# $Id:$
use strict;
use warnings;
use MooseX::Has::Sugar;
use namespace::autoclean;

sub generated { { isa => 'Str', ro, } }

sub manual { { isa => 'Str', is => 'ro', } }

1;

