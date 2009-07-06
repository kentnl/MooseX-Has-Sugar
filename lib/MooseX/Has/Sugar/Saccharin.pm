package MooseX::Has::Sugar::Saccharin;

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

=head1 SYNOPSIS

This is a highly experimental sugaring module. No Guarantees of stability.

    has name   => rw Str, default { 1 };
    has suffix => required rw Str;
    has 'suffix', required rw Str;

Your choice. 

=head1 ACKNOWLEDGEMENTS

=cut
