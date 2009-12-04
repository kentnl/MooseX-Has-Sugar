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

=export_group :default

exports  L</ro>, L</rw>, L</required>, L</lazy>, L</lazy_build>, L</coerce>, L</weak_ref>, L</auto_deref>,
      L</bare>, L</default>, L</init_arg>, L</predicate>, L</clearer>, L</builder>, L</trigger>,

=cut

Sub::Exporter::setup_exporter(
  {
    exports => [
      'ro',   'rw',      'required', 'lazy',      'lazy_build', 'coerce',  'weak_ref', 'auto_deref',
      'bare', 'default', 'init_arg', 'predicate', 'clearer',    'builder', 'trigger',
    ],
    groups => { default => ['-all'], }
  }
);

=export_function bare

=export_function bare $Type

    bare Str

equivalent to this

    is => 'bare', isa => Str

=cut

sub bare($) {
  return ( 'is', 'bare', 'isa', shift, );
}

=export_function ro

=export_function ro $Type

    ro Str

equivalent to this

    is => 'ro', isa => Str,

=cut

sub ro($) {
  return ( 'is', 'ro', 'isa', shift, );
}

=export_function rw

=export_function rw $Type

    rw Str

equivalent to this

    is => 'rw', isa => Str

=cut

sub rw($) {
  return ( 'is', 'rw', 'isa', shift, );
}

=export_function required

=export_function required @rest

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

=export_function lazy

=export_function lazy @rest

like C<< ( lazy => 1 , @rest ) >>

=cut

sub lazy(@) {
  return ( 'lazy', 1, @_ );
}

=export_function lazy_build

=export_function lazy_build @rest

like C<< ( lazy_build => 1, @rest ) >>

=cut

sub lazy_build(@) {
  return ( 'lazy_build', 1, @_ );
}

=export_function weak_ref

=export_function weak_ref @rest

like C<< ( weak_ref => 1, @rest ) >>

=cut

sub weak_ref(@) {
  return ( 'weak_ref', 1, @_ );
}

=export_function coerce

=export_function @rest

like C<< ( coerce => 1, @rest ) >>

=head3 WARNING:

Conflicts with L</MooseX::Types>

=cut

sub coerce(@) {
  return ( 'coerce', 1, @_ );
}

=export_function auto_deref

=export_function auto_deref @rest

like C<< ( auto_deref => 1, @rest ) >>

=cut

sub auto_deref(@) {
  return ( 'auto_deref', 1, @_ );
}

=export_function builder

=export_function builder $buildername

ie:

    required rw Str, builder '_build_foo'

is like

    builder => '_build_foo'

=cut

sub builder($) {
  return ( 'builder', shift );
}

=export_function predicate

=export_function predicate $predicatename

see L</builder>

=cut

sub predicate($) {
  return ( 'predicate', shift );
}

=export_function clearer

=export_function clearer $clearername

see L</builder>

=cut

sub clearer($) {
  return ( 'clearer', shift );
}

=export_function init_arg

=export_function init_arg $argname

see L</builder>

=cut

sub init_arg($) {
  return ( 'init_arg', shift );
}

=export_function default

=export_function default { $code }

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

=export_function trigger

=export_function trigger { $code }

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

=head1 CONFLICTS

=head2 MooseX::Has::Sugar

=head2 MooseX::Has::Sugar::Minimal

This module is not intended to be used in conjunction with
 L<MooseX::Has::Sugar> or L<MooseX::Has::Sugar::Minimal>

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
