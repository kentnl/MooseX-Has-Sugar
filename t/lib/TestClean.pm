package TestClean;
our $VERSION = '0.0405';



# $Id:$
my $CLASS = __PACKAGE__;
use base 'Test::Builder::Module';
@EXPORT = qw( is_clean );

sub pp {
  require Data::Dumper;
  local $Data::Dumper::Terse  = 1;
  local $Data::Dumper::Useqq  = 1;
  local $Data::Dumper::Indent = 0;
  return Data::Dumper::Dumper(shift);
}

sub is_clean($;$) {
  my $file = shift;
  my $msg  = shift;
  $msg ||= "Cleanlyness for $file";
  my $tb = $CLASS->builder;
  my $fh;
  my $o;
  if ( not open $fh, '<', $file ) {
    my $o = $tb->ok( 0, $msg );
    $tb->diag("Loading $file Failed");
    return $o;
  }
  while ( my $line = <$fh> ) {

    # Tailing Whitespace is pesky
    if ( $line =~ qr/\h$/m ) {
      $o = $tb->ok( 0, $msg ) unless $o;
      $tb->diag( "\n\n\\h found on end of line $. in $file\n" . pp($line) . "\n" );
    }

    # Tabs are teh satan.
    if ( $line =~ qr/\t/m ) {
      $o = $tb->ok( 0, $msg ) unless $o;
      $tb->diag( "\\t found in line $. in $file\n" . pp($line) . "\n" );
    }

    # Perltidyness in teh comments
    if ( $line =~ qr/[)][{]/ ) {
      $o = $tb->ok( 0, $msg ) unless $o;
      $tb->diag( ')' . "{ found in line $. in $file\n" . pp($line) . "\n" );
    }
  }
  close $fh;
  if ($o) {
    return $o;
  }
  return $tb->ok( 1, $msg );
}

1;
