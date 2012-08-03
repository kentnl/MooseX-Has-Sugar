use warnings;
use strict;

package MooseX::Has::Sugar::Minimal;
BEGIN {
  $MooseX::Has::Sugar::Minimal::AUTHORITY = 'cpan:KENTNL';
}
{
  $MooseX::Has::Sugar::Minimal::VERSION = '0.05070421';
}

# ABSTRACT: Less Sugary Syntax for moose 'has' fields

use Sub::Exporter ();



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
=pod

=head1 NAME

MooseX::Has::Sugar::Minimal - Less Sugary Syntax for moose 'has' fields

=head1 VERSION

version 0.05070421

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

=head1 EXPORT GROUPS

=head2 :default

Exports L</:is>

=head2 :is

Exports L</bare>, L</ro>, L</rw>

=head1 EXPORTED FUNCTIONS

=head2 bare

returns C<('bare')>

=head2 ro

returns C<('ro')>

=head2 rw

returns C<('rw')>

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

=head1 AUTHOR

Kent Fredric <kentnl at cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2012 by Kent Fredric.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

