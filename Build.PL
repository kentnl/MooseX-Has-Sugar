
use strict;
use warnings;

use Module::Build 0.3601;


my %module_build_args = (
  "build_requires" => {
    "Module::Build" => "0.4202"
  },
  "configure_requires" => {
    "Module::Build" => "0.4202"
  },
  "dist_abstract" => "Sugar Syntax for moose 'has' fields",
  "dist_author" => [
    "Kent Fredric <kentnl at cpan.org>"
  ],
  "dist_name" => "MooseX-Has-Sugar",
  "dist_version" => "0.05070422",
  "license" => "perl",
  "module_name" => "MooseX::Has::Sugar",
  "recommends" => {},
  "recursive_test_files" => 1,
  "requires" => {
    "Carp" => 0,
    "Sub::Exporter" => 0,
    "perl" => "5.006",
    "strict" => 0,
    "warnings" => 0
  },
  "script_files" => [],
  "test_requires" => {
    "Moose" => 0,
    "MooseX::Types::Moose" => 0,
    "Test::Fatal" => 0,
    "Test::More" => "1.001002",
    "lib" => 0,
    "namespace::autoclean" => 0
  }
);


my %fallback_build_requires = (
  "Module::Build" => "0.4202",
  "Moose" => 0,
  "MooseX::Types::Moose" => 0,
  "Test::Fatal" => 0,
  "Test::More" => "1.001002",
  "lib" => 0,
  "namespace::autoclean" => 0
);


unless ( eval { Module::Build->VERSION(0.4004) } ) {
  delete $module_build_args{test_requires};
  $module_build_args{build_requires} = \%fallback_build_requires;
}

my $build = Module::Build->new(%module_build_args);

$build->create_build_script;
