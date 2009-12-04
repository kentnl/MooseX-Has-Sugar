use warnings;
use strict;

package MooseX::Has::Sugar;

# ABSTRACT: Sugar Syntax for moose 'has' fields

=head1 SYNOPSIS

L<Moose> C<has> syntax is generally fine, but sometimes one gets bothered with
the constant typing of string quotes for things. L<MooseX::Types> exists and in
many ways reduces the need for constant string creation.

=head2 Primary Benefits at a Glance

=head3 Reduced Typing in C<has> declarations.

The constant need to type C<=E<gt>> and C<''> is fine for one-off cases, but
the instant you have more than about 4 attributes it starts to get annoying.

=head3 More compact declarations.

Reduces much of the redundant typing in most cases, which makes your life easier,
and makes it take up less visual space, which makes it faster to read.

=head3 No String Worries

Strings are often problematic, due to whitespace etc. Noted that if you do
happen to mess them up, Moose should at I<least> warn you that you've done
something daft. Using this alleviates that worry.

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

    use MooseX::Types::Moose qw( Str );
    use MooseX::Has::Sugar;

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

Or even

    use MooseX::Types::Moose qw( Str );
    use MooseX::Has::Sugar;

    has foo => ( isa => Str, ro,  required, );
    has bar => ( isa => Str, rw,  lazy_build, );

=head2 Alternative Forms

=head3 Basic C<is> Expansion Only

( using L<MooseX::Has::Sugar::Minimal> instead )

    use MooseX::Types::Moose qw( Str );
    use MooseX::Has::Sugar::Minimal;

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

=head3 Attribute Expansions with Basic Expansions

( Combining parts of this and L<MooseX::Has::Sugar::Minimal> )

    use MooseX::Types::Moose qw( Str );
    use MooseX::Has::Sugar::Minimal;
    use MooseX::Has::Sugar qw( :attrs );

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

=cut

use Carp          ();
use Sub::Exporter ();

=export_group :default

Since 0.0300, this exports all our syntax, the same as C<:attrs :isattrs>.
Primarily because I found you generally want all the sugar, not just part of it.
This also gets rid of that nasty exclusion logic.

=export_group :isattrs

This exports C<ro>, C<rw> and C<bare> as lists, so they behave as stand-alone attrs like
L</lazy> does.

    has foo => (
            required,
            isa => 'Str',
            ro,
    );

B<NOTE: This option is incompatible with L<MooseX::Has::Sugar::Minimal>> : L</CONFLICTS>

=export_group :attrs

This exports L</lazy> , L</lazy_build> and L</required>, L</coerce>, L</weak_ref>
and L</auto_deref> as subs that assume positive.

    has foo => (
            required,
            isa => 'Str',
    );

B<NOTE: This option is incompatible with L<MooseX::Types> and L<Moose::Util::TypeConstraints>> : L</CONFLICTS>

=export_group :is

B<DEPRECATED>. See L<MooseX::Has::Sugar::Minimal> for the same functionality

=export_group :allattrs

B<DEPRECATED>, just use L</:default> or do

    use MooseX::Has::Sugar;

=cut

Sub::Exporter::setup_exporter(
  {
    as      => 'do_import',
    exports => [ 'ro', 'rw', 'required', 'lazy', 'lazy_build', 'coerce', 'weak_ref', 'auto_deref', 'bare', ],
    groups  => {
      isattrs => [ 'ro',       'rw',   'bare', ],
      attrs   => [ 'required', 'lazy', 'lazy_build', 'coerce', 'weak_ref', 'auto_deref', ],
      default => [ '-attrs', '-isattrs' ],
    }
  }
);

sub import {
  for (@_) {
    if ( $_ =~ qr/^[:-]is\$/ ) {
      Carp::croak( qq{Trivial ro/rw with :is dropped as of 0.0300.\n} . q{ See MooseX::Has::Sugar::Minimal for those. } );
    }
    if ( $_ =~ qr/^[:-]allattrs\$/ ) {
      Carp::carp(q{MooseX::Has::Sugar->import(:allattrs) is deprecated. just do 'use MooseX::Has::Sugar;' instead.});
      $_ =~ s/^[:-]allattrs\$/:default/;
    }
  }
  goto &MooseX::Has::Sugar::do_import;
}

=export_function bare

returns C<('is','bare')>

=cut

sub bare() {
  return ( 'is', 'bare' );
}

=export_function ro

returns C<('is','ro')>

=cut

sub ro() {
  return ( 'is', 'ro' );
}

=export_function rw

returns C<('is','rw')>

=cut

sub rw() {
  return ( 'is', 'rw' );
}

=export_function required

returns C<('required',1)>

=cut

sub required() {
  return ( 'required', 1 );
}

=export_function lazy

returns C<('lazy',1)>

=cut

sub lazy() {
  return ( 'lazy', 1 );
}

=export_function lazy_build

returns C<('lazy_build',1)>

=cut

sub lazy_build() {
  return ( 'lazy_build', 1 );
}

=export_function weak_ref

returns C<('weak_ref',1)>

=cut

sub weak_ref() {
  return ( 'weak_ref', 1 );
}

=export_function coerce

returns C<('coerce',1)>

B<WARNING:> Conflict with L<MooseX::Types> and L<Moose::Util::TypeConstraints>, see L<CONFLICTS>.

=cut

sub coerce() {
  return ( 'coerce', 1 );
}

=export_function auto_deref

returns C<('auto_deref',1)>

=cut

sub auto_deref() {
  return ( 'auto_deref', 1 );
}
1;

=head1 CONFLICTS

=head2 MooseX::Has::Sugar::Minimal

=head2 MooseX::Has::Sugar::Saccharin

This module is not intended to be used in conjunction with
 L<MooseX::Has::Sugar::Minimal> or L<MooseX::Has::Sugar::Saccharin>

We export many of the same symbols and its just not very sensible.

=head2 MooseX::Types

=head2 Moose::Util::TypeConstraints

due to exporting the L</coerce> symbol, using us in the same scope as a call to

    use MooseX::Types ....

or
    use Moose::Util::TypeConstraints

will result in a symbol collision.

We recommend using and creating proper type libraries instead, ( which will absolve you entirely of the ned to use MooseX::Types and MooseX::Has::Sugar(::*)? in the same scope )

=cut