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

sub bare() {
    return ('bare');
}

sub ro() {
    return ('ro');
}

sub rw() {
    return ('rw');
}

1;

__END__


=head1 EXPORT

=over 4

=item rw

=item ro

=item bare

=back

=head1 EXPORT GROUPS

=over 4

=item :default

Exports C<:is>

=item :is

Exports C<ro> and C<rw> and C<bare>

=back

=head1 CONFLICTS

This module is not intended to be used in conjunction with
 L<MooseX::Has::Sugar>.

We both export C<ro> and C<rw> in different ways.

If you do however want to use them in conjuction, specific imports must
 be done on L<MooseX::Has::Sugar>'s side to stop it exporting different
 ro/rw. Any of the below should be fine.

    use MooseX::Has::Sugar::Minimal;
    use MooseX::Has::Sugar qw( :attrs );

    has foo =>( is => rw , lazy_build );

    use MooseX::Has::Sugar::Minimal;
    use MooseX::Has::Sugar qw( lazy_build );

    has foo =>( is => rw , lazy_build );

=head1 FUNCTIONS

These you probably don't care about, they're all managed by L<Sub::Exporter>
 and its stuff anyway.

=over 4

=item rw

returns C<('rw')>

=item ro

returns C<('ro')>

=item bare

returns C<('bare')>

=back

=head1 ACKNOWLEDGEMENTS

=cut
