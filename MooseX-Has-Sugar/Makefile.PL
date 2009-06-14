use inc::Module::Install;

name     'MooseX-Has-Sugar';
all_from 'lib/MooseX/Has/Sugar.pm';
author   'Kent Fredric <kentnl@cpan.org>';
license  'perl';
version  '0.0200';

repository 'git://github.com/kentfredric/MooseX-Has-Sugar.git';

test_requires 'Test::More';
test_requires 'Test::Exception';
test_requires 'Moose';
test_requires 'Sub::Exporter';
test_requires 'Find::Lib';

requires 'Sub::Exporter';

WriteAll;

