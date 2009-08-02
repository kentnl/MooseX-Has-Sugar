
use strict;
use warnings;

use ExtUtils::MakeMaker;

WriteMakefile(
  DISTNAME  => 'MooseX-Has-Sugar',
  NAME      => 'MooseX::Has::Sugar',
  AUTHOR    => 'Kent\ Fredric\ \<kentnl\ at\ cpan\.org\>',
  ABSTRACT  => 'Sugar\ Syntax\ for\ moose\ \'has\'\ fields',
  VERSION   => '0.0404',
  EXE_FILES => [ qw() ],
  (eval { ExtUtils::MakeMaker->VERSION(6.21) } ? (LICENSE => 'perl') : ()),
  PREREQ_PM    => {
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
);
