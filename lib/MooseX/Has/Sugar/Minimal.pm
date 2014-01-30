use 5.006;    # pragmas
use warnings;
use strict;

package MooseX::Has::Sugar::Minimal;

# ABSTRACT: Less Sugary Syntax for moose 'has' fields

# AUTHORITY

use Sub::Exporter::Progressive -setup => {
  exports => [ 'ro', 'rw', 'bare', ],
  groups  => {
    is      => [ 'ro', 'rw', 'bare', ],
    default => [ '-all', ],
  },
};

=head1 SYNOPSIS

This is a legacy variant of L<Sugar|MooseX::Has::Sugar> which only exports C<ro>
and C<rw> functions, the way L<MooseX::Has::Sugar|MooseX::Has::Sugar> used to with C<:is>;

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

All functions are exported by L<The Sub::Exporter Module|Sub::Exporter>.

=cut

=export_group C<:default>

Exports L</:is>

=export_group C<:is>

Exports L</bare>, L</ro>, L</rw>

=cut

=export_function C<bare>

returns C<('bare')>

=cut

sub bare() {
  return ('bare');
}

=export_function C<ro>

returns C<('ro')>

=cut

sub ro() {
  return ('ro');
}

=export_function C<rw>

returns C<('rw')>

=cut

sub rw() {
  return ('rw');
}

1;

=head1 CONFLICTS

=head2 MooseX::Has::Sugar

=head2 MooseX::Has::Sugar::Saccharin

This module is not intended to be used in conjunction with
 L<::Sugar|MooseX::Has::Sugar> or L<::Sugar::Saccharin|MooseX::Has::Sugar::Saccharin>.

We all export L</ro> and L</rw> in different ways.

If you do however want to use them in conjunction, specific imports must
 be done on L<MooseX::Has::Sugar's|MooseX::Has::Sugar> side to stop it exporting different
 ro/rw. Any of the below should be fine.

    use MooseX::Has::Sugar::Minimal;
    use MooseX::Has::Sugar qw( :attrs );

    has foo =>( is => rw , lazy_build );

    use MooseX::Has::Sugar::Minimal;
    use MooseX::Has::Sugar qw( lazy_build );

    has foo =>( is => rw , lazy_build );

=cut
