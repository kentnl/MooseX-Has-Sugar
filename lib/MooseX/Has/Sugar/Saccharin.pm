package MooseX::Has::Sugar::Saccharin;
our $VERSION = '0.0404';


# ABSTRACT: Experimental sweetness

use warnings;
use strict;


use Carp          ();
use Sub::Exporter ();

Sub::Exporter::setup_exporter(
  {
    exports => [
      'ro',   'rw',      'required', 'lazy',      'lazy_build', 'coerce',  'weak_ref', 'auto_deref',
      'bare', 'default', 'init_arg', 'predicate', 'clearer',    'builder', 'trigger',
    ],
    groups => { default => ['-all'], }
  }
);


sub bare($) {
  return ( 'is', 'bare', 'isa', shift, );
}


sub ro($) {
  return ( 'is', 'ro', 'isa', shift, );
}


sub rw($) {
  return ( 'is', 'rw', 'isa', shift, );
}


sub required(@) {
  return ( 'required', 1, @_ );
}


sub lazy(@) {
  return ( 'lazy', 1, @_ );
}


sub lazy_build(@) {
  return ( 'lazy_build', 1, @_ );
}


sub weak_ref(@) {
  return ( 'weak_ref', 1, @_ );
}


sub coerce(@) {
  return ( 'coerce', 1, @_ );
}


sub auto_deref(@) {
  return ( 'auto_deref', 1, @_ );
}


sub builder($) {
  return ( 'builder', shift );
}


sub predicate($) {
  return ( 'predicate', shift );
}


sub clearer($) {
  return ( 'clearer', shift );
}


sub init_arg($) {
  return ( 'init_arg', shift );
}


sub default(&) {
  my $code = shift;
  return (
    'default',
    sub {
      my $self = $_[0];
      local $_ = $self;
      return $code->();
    }
  );
}


sub trigger(&) {
  my $code = shift;
  return (
    'trigger',
    sub {
      my $self = $_[0];
      local $_ = $self;
      return $code->();
    }
  );
}
1;


__END__

=pod

=head1 NAME

MooseX::Has::Sugar::Saccharin - Experimental sweetness

=head1 VERSION

version 0.0404

=head1 SYNOPSIS

This is a highly experimental sugaring module. No Guarantees of stability.

    has name   => rw Str, default { 1 };
    has suffix => required rw Str;
    has 'suffix', required rw Str;

Your choice.

=head1 FUNCTIONS

=head2 bare $Type

    bare Str

equivalent to this

    is => 'bare', isa => Str

=head2 ro $Type

    ro Str

equivalent to this

    is => 'ro', isa => Str,

=head2 rw $Type

    rw Str

equivalent to this

    is => 'rw', isa => Str

=head2 required @rest

this

    required rw Str

is equivalent to this

    required => 1, is => 'rw', isa => Str,

this

    rw Str, required

is equivalent to this

    is => 'rw', isa => Str , required => 1

=head2 lazy @rest

like C<( lazy => 1 , @rest )>

=head2 lazy_build @rest

like C<( lazy_build => 1, @rest )>

=head2 weak_ref @rest

like C<( weak_ref => 1, @rest )>

=head2 coerce @rest

like C<( coerce => 1, @rest )>

=head2 auto_deref @rest

like C<( auto_deref => 1, @rest )>

=head2 builder $buildername

ie:

    required rw Str, builder '_build_foo'

is like

    builder => '_build_foo'

=head2 predicate $predicatename

see builder

=head2 clearer $clearername

see builder

=head2 init_arg $argname

see builder

=head2 default { $code }

Examples:

    default { 1 }
    default { { } }
    default { [ ] }
    default { $_->otherfield }

$_ is localised as the same value as $_[0] for convenience ( usually $self )

=head2 trigger { $code }

Works exactly like default.

=head1 ACKNOWLEDGEMENTS

=head1 AUTHOR

  Kent Fredric <kentnl at cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2009 by Kent Fredric.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut


