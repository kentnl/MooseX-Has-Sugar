use strict;
use warnings;

use Test::More tests => 3;    # last test to print
use Find::Lib './09_saccharin';
use TestPackage;

is_deeply( TestPackage->Alpha->{orig},                TestPackage->Alpha->{mx},                'Basic Use Case', );
is_deeply( TestPackage->Beta->{orig},                 TestPackage->Beta->{mx},                 'Order Invert', );
is_deeply( TestPackage->Gamma->{orig}->{default}->(), TestPackage->Gamma->{mx}->{default}->(), 'Subs', );

