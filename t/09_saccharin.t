use strict;
use warnings;

use Test::More tests => 3;    # last test to print
use FindBin;
use lib "$FindBin::Bin/lib";

use T9Saccharin::TestPackage;

is_deeply( T9Saccharin::TestPackage->Alpha->{orig}, T9Saccharin::TestPackage->Alpha->{mx}, 'Basic Use Case', );
is_deeply( T9Saccharin::TestPackage->Beta->{orig},  T9Saccharin::TestPackage->Beta->{mx},  'Order Invert', );
is_deeply( T9Saccharin::TestPackage->Gamma->{orig}->{default}->(), T9Saccharin::TestPackage->Gamma->{mx}->{default}->(), 'Subs',
);

