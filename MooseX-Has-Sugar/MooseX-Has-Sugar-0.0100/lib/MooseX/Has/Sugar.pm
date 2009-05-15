package MooseX::Has::Sugar;

use warnings;
use strict;

our $VERSION = '0.0100';

use Sub::Exporter -setup => {
    exports => [ qw( ro attr_ro rw attr_rw required lazy lazy_build ) ],
    groups  => {
        is      => [qw( ro rw )],
        isattrs => [
            attr_ro => { -as => 'ro' },
            attr_rw => { -as => 'rw' },
        ],
        attrs    => [qw( required lazy lazy_build )],
        allattrs => [qw( -attrs -isattrs )],
        defaults => [qw( -is )],
    }
};

sub ro() {
    'ro';
}

sub attr_ro() {
    return ( 'is', 'ro' );
}

sub rw() {
    'rw';
}

sub attr_rw() {
    return ( 'is', 'rw' );
}

sub required() {
    return ( 'required', 1 );
}

sub lazy() {
    return ( 'lazy', 1 );
}

sub lazy_build() {
    return ( 'lazy_build', 1 );
}

1;

__END__

=head1 NAME

MooseX::Has::Sugar - Sugar Syntax for moose 'has' fields.

=head1 VERSION

Version 0.0100

=head1 SYNOPSIS

Moose c<has> syntax is generally fine, but sometimes one gets bothered with the constant
typing of string quotes for things. L<MooseX::Types> exists and in many ways reduces the need
for constant string creation.

Strings are a bit problematic though, due to whitespace etc, and you're not likely to get compile time warnings if you do them wrong.

The constant need to type => and '' is fine for one-off cases, but the instant you have more than about 4 attributes it starts to get annoying.

The only problem I see with the approach given by this module is the potential of an extra level of indirection. But its a far lesser evil in my mind than the alternative.

=head2 Before this Module.

=head3 Classical Moose

    has foo => (
            isa => 'Str',
            is  => 'ro',
            required => 1,
    );

    has bar => (
            isa => 'Str',
            is => 'rw'
            lazy_build => 1,
    );

=head3 Lazy Evil way to do it:

B<PLEASE DONT DO THIS>

    has qw( foo isa Str is ro required 1 );
    has qw( bar isa Str is rw lazy_build 1 );


=head2 With this module

( and with MooseX::Types )

=head3 Basic C<is> Expansion

    use MooseX::Types::Moose qw( Str );
    use MooseX::Has::Sugar qw( :is );

    has foo => (
            isa => Str,
            is  => ro,
            required => 1,
    );
    has bar => (
            isa => Str,
            is => rw,
            lazy_build => 1,
    );

=head3 Attribute Expansions

    use MooseX::Types::Moose qw( Str );
    use MooseX::Has::Sugar qw( :is :attrs );

    has foo => (
            isa => Str,
            is  => ro,
            required,
    );
    has bar => (
            isa => Str,
            is => rw,
            lazy_build,
    );

=head3 Full Attribute Expansion

    use MooseX::Types::Moose qw( Str );
    use MooseX::Has::Sugar qw(  :allattrs );

    has foo => (
            isa => Str,
            ro,
            required,
    );
    has bar => (
            isa => Str,
            rw,
            lazy_build,
    );

=head1 EXPORT

Most of these exports just return either 1 string, or 2 strings, and should fold in at compile time. Make sure to see L</EXPORT_GROUPS> for more.

=over 4

=item rw

What this will be depends on your export requirements.

=item ro

What this will be depends on your export requirements.

=item lazy

=item lazy_build

=item required

=back

=head1 EXPORT GROUPS

=over 4

=item :default

This exports 'ro' and 'rw' as basic constant-folded subs. That is all. Same as c<:is>

=item :is

This exports 'ro' and 'rw' as basic constant folded subs.

    has foo => (
            isa => 'Str',
            is => ro,
            required => 1,
    );

=item :attrs

This exports C<lazy> , C<lazy_build> and C<required> as subs that assume positive.

    has foo => (
            required,
            isa => 'Str',
    );

=item :isattrs

This exports C<ro> and C<rw> differently, so they behave as stand-alone attrs like 'lazy' does.

    has foo => (
            required,
            isa => 'Str',
            ro,
    );

B<NOTE: This option is incompatible with :is as they export the same symbols in different ways>

=item :allattrs

This is  a shorthand for  qw( :isattrs :attrs )

=back

=head1 FUNCTIONS

These you probably don't care about, they're all managed by L<Sub::Exporter> and its stuff anyway.

=over 4

=item rw

returns C<'rw'>

=item attr_rw

returns C<('is','rw')>

=item ro

returns C<'ro'>

=item attr_ro

returns C<('is','ro')>

=item lazy

returns C<('lazy',1)>

=item required

returns C<('required',1)>

=item lazy_build

returns C<('lazy_build',1)>

=back

=head1 AUTHOR

Kent Fredric, C<< <kentnl at cpan.org> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-moosex-has-extras at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=MooseX-Has-Sugar>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.

=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc MooseX::Has::Sugar


You can also look for information at:

=over 4

=item * RT: CPAN's request tracker

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=MooseX-Has-Sugar>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/MooseX-Has-Sugar>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/MooseX-Has-Sugar>

=item * Search CPAN

L<http://search.cpan.org/dist/MooseX-Has-Sugar/>

=back


=head1 ACKNOWLEDGEMENTS


=head1 COPYRIGHT & LICENSE

Copyright 2009 Kent Fredric, all rights reserved.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.


=cut

# End of MooseX::Has::Sugar
