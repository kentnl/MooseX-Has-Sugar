use warnings;
use strict;

package MooseX::Has::Sugar::Saccharin;

# ABSTRACT: Experimental sweetness

=head1 SYNOPSIS

This is a highly experimental sugaring module. No Guarantees of stability.

    has name   => rw Str, default { 1 };
    has suffix => required rw Str;
    has 'suffix', required rw Str;

Your choice.

=cut

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

=head1 FUNCTIONS

=head2 bare $Type

    bare Str

equivalent to this

    is => 'bare', isa => Str

=cut

sub bare($) {
  return ( 'is', 'bare', 'isa', shift, );
}

=head2 ro $Type

    ro Str

equivalent to this

    is => 'ro', isa => Str,

=cut

sub ro($) {
  return ( 'is', 'ro', 'isa', shift, );
}

=head2 rw $Type

    rw Str

equivalent to this

    is => 'rw', isa => Str

=cut

sub rw($) {
  return ( 'is', 'rw', 'isa', shift, );
}

=head2 required @rest

this

    required rw Str

is equivalent to this

    required => 1, is => 'rw', isa => Str,


this

    rw Str, required

is equivalent to this

    is => 'rw', isa => Str , required => 1

=cut

sub required(@) {
  return ( 'required', 1, @_ );
}

=head2 lazy @rest

like C<( lazy => 1 , @rest )>

=cut

sub lazy(@) {
  return ( 'lazy', 1, @_ );
}

=head2 lazy_build @rest

like C<( lazy_build => 1, @rest )>

=cut

sub lazy_build(@) {
  return ( 'lazy_build', 1, @_ );
}

=head2 weak_ref @rest

like C<( weak_ref => 1, @rest )>

=cut

sub weak_ref(@) {
  return ( 'weak_ref', 1, @_ );
}

=head2 coerce @rest

like C<( coerce => 1, @rest )>

=cut

sub coerce(@) {
  return ( 'coerce', 1, @_ );
}

=head2 auto_deref @rest

like C<( auto_deref => 1, @rest )>

=cut

sub auto_deref(@) {
  return ( 'auto_deref', 1, @_ );
}

=head2 builder $buildername

ie:

    required rw Str, builder '_build_foo'

is like

    builder => '_build_foo'

=cut

sub builder($) {
  return ( 'builder', shift );
}

=head2 predicate $predicatename

see builder

=cut

sub predicate($) {
  return ( 'predicate', shift );
}

=head2 clearer $clearername

see builder

=cut

sub clearer($) {
  return ( 'clearer', shift );
}

=head2 init_arg $argname

see builder

=cut

sub init_arg($) {
  return ( 'init_arg', shift );
}

=head2 default { $code }

Examples:

    default { 1 }
    default { { } }
    default { [ ] }
    default { $_->otherfield }

$_ is localised as the same value as $_[0] for convenience ( usually $self )

=cut

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

=head2 trigger { $code }

Works exactly like default.

=cut

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

=head1 ACKNOWLEDGEMENTS

=cut
