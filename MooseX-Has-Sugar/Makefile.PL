use inc::Module::Install;

name     'MooseX-Has-Sugar';
all_from 'lib/MooseX/Has/Sugar.pm';
author   'Kent Fredric <kentnl@cpan.org>';
license  'perl';
version  '0.0100';

repository 'git://github.com/kentfredric/MooseX-Has-Sugar.git';

test_requires 'Test::More';

requires 'Sub::Exporter';

WriteAll;

