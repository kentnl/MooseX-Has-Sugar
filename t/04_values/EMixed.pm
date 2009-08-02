package EMixed;
our $VERSION = '0.0404';


# $Id:$
use strict;
use warnings;
use Moose;
use MooseX::Has::Sugar::Minimal;
use MooseX::Has::Sugar qw( :attrs );
use namespace::autoclean;

sub generated {
    {
        isa => 'Str',
        is  => ro,
        required, lazy, lazy_build, coerce, weak_ref, auto_deref
    };
}

sub manual {
    {
        isa        => 'Str',
        is         => 'ro',
        required   => 1,
        lazy       => 1,
        lazy_build => 1,
        coerce     => 1,
        weak_ref   => 1,
        auto_deref => 1,
    };
}

__PACKAGE__->meta->make_immutable;
1;

