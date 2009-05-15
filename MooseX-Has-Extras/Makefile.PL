use inc::Module::Install;

name     'MooseX-Has-Extras';
all_from 'lib/MooseX/Has/Extras.pm';
author   'Kent Fredric <kentnl@cpan.org>';
license  'perl';

build_requires 'Test::More';


WriteAll;

