use warnings;
use strict;

package MooseX::Has::Sugar::Minimal;

# ABSTRACT: Less Sugary Syntax for moose 'has' fields

use Sub::Exporter ();

=head1 SYNOPSIS

This is a legacy variant of L<MooseX::Has::Sugar> which only exports C<ro>
and C<rw> functions, the way L<MooseX::Has::Sugar> used to with C<:is>;

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

All functions are exported by L<Sub::Exporter>.

=cut

=export_group :default

Exports L</:is>

=export_group :is

Exports L</bare>, L</ro>, L</rw>

=cut

Sub::Exporter::setup_exporter(
  {
    exports => [ 'ro', 'rw', 'bare', ],
    groups  => {
      is      => [ 'ro', 'rw', 'bare', ],
      default => ['-is'],
    }
  }
);

=export_function bare

returns C<('bare')>

=cut

sub bare() {
  return ('bare');
}

=export_function ro

returns C<('ro')>

=cut

sub ro() {
  return ('ro');
}

=export_function rw

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
 L<MooseX::Has::Sugar> or L<MooseX::Has::Sugar::Saccharin>.

We all export L</ro> and L</rw> in different ways.

If you do however want to use them in conjuction, specific imports must
 be done on L<MooseX::Has::Sugar>'s side to stop it exporting different
 ro/rw. Any of the below should be fine.

    use MooseX::Has::Sugar::Minimal;
    use MooseX::Has::Sugar qw( :attrs );

    has foo =>( is => rw , lazy_build );

    use MooseX::Has::Sugar::Minimal;
    use MooseX::Has::Sugar qw( lazy_build );

    has foo =>( is => rw , lazy_build );

=cut
