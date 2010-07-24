
use strict;
use warnings;

use Module::Build 0.3601;


my %module_build_args = (
  'build_requires' => {
    'File::Find' => '0',
    'File::Temp' => '0',
    'FindBin' => '0',
    'Module::Build' => '0.3601',
    'Moose' => '0',
    'Test::Exception' => '0',
    'Test::More' => '0.88',
    'namespace::autoclean' => '0'
  },
  'configure_requires' => {
    'Module::Build' => '0.3601'
  },
  'dist_abstract' => 'Sugar Syntax for moose \'has\' fields',
  'dist_author' => [
    'Kent Fredric <kentnl at cpan.org>'
  ],
  'dist_name' => 'MooseX-Has-Sugar',
  'dist_version' => '0.05044303',
  'license' => 'perl',
  'module_name' => 'MooseX::Has::Sugar',
  'recommends' => {},
  'recursive_test_files' => 1,
  'requires' => {
    'Carp' => '0',
    'Sub::Exporter' => '0'
  },
  'script_files' => []
);


my $build = Module::Build->new(%module_build_args);

$build->create_build_script;
