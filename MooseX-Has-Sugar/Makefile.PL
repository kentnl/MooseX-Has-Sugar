use inc::Module::Install;

name     'MooseX-Has-Sugar';
all_from 'lib/MooseX/Has/Sugar.pm';
author   'Kent Fredric <kentnl@cpan.org>';
license  'perl';

build_requires 'Test::More';

requires 'Sub::Exporter';


WriteAll;

