
use strict;
use warnings;

use Module::Build;

my $build = Module::Build->new(
  module_name   => 'MooseX::Has::Sugar',
  license       => 'perl',
  dist_abstract => "Sugar\ Syntax\ for\ moose\ \'has\'\ fields",
  dist_name     => "MooseX\-Has\-Sugar",
  dist_author   => [
"Kent\ Fredric\ \<kentnl\ at\ cpan\.org\>",
  ],
  requires      => {
    "MooseX::Types::Moose" => '0',
    "namespace::autoclean" => '0',
    "Test::Exception" => '0',
    "Sub::Exporter" => '0',
    "Carp" => '0',
    "Test::More" => '0',
    "Find::Lib" => '0',
    "Test::use::ok" => '0',
    "Moose" => '0.84',
  },
  script_files => [ qw() ],
);

$build->create_build_script;
