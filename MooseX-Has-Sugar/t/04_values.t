use strict;
use warnings;

use Test::More tests => 6;    # last test to print

{

    package A;
    use MooseX::Has::Sugar qw( :is );

    ::is_deeply(
        {
            isa => 'Str',
            is  => ro,
        },
        {
            isa => 'Str',
            is  => 'ro'
        },
        "Simple Expansion ro"
    );

    ::is_deeply(
        {
            isa => 'Str',
            is  => rw,
        },
        {
            isa => 'Str',
            is  => 'rw'
        },
        "Simple Expansion rw"
    );
    no MooseX::Has::Sugar;
}
{

    package B;
    use MooseX::Has::Sugar qw( :attrs );
    ::is_deeply(
        {
            isa => 'Str',
            is  => 'ro',
            required, lazy, lazy_build, coerce, weak_ref, auto_deref
        },
        {
            isa        => 'Str',
            is         => 'ro',
            required   => 1,
            lazy       => 1,
            lazy_build => 1,
            coerce     => 1,
            weak_ref   => 1,
            auto_deref => 1,
        },
        "Attr Expansion"
    );
    no MooseX::Has::Sugar;
}

{

    package C;
    use MooseX::Has::Sugar qw( :isattrs );
    ::is_deeply(
        {
            isa => 'Str',
            ro,
        },
        {
            isa => 'Str',
            is  => 'ro',
        },
        "is Attr Expansion"
    );
    no MooseX::Has::Sugar;
}

{

    package D;
    use MooseX::Has::Sugar qw( :allattrs );
    ::is_deeply(
        {
            isa => 'Str',
            ro, required, lazy, lazy_build, coerce, weak_ref, auto_deref
        },
        {
            isa        => 'Str',
            is         => 'ro',
            required   => 1,
            lazy       => 1,
            lazy_build => 1,
            coerce     => 1,
            weak_ref   => 1,
            auto_deref => 1,
        },
        "All Attr Expansion"
    );
    no MooseX::Has::Sugar;
}

if (
    eval qq{
    package E;
    use MooseX::Has::Sugar qw( :is :allattrs );

    1;
}
  )
{
    fail("Conflicting Parameters must not be permitted");
}
else {
    pass("Conflicting Parameters are not permitted");
}
