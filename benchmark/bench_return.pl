#!/usr/bin/env perl
# FILENAME: bench_return.pl
# CREATED: 06/26/14 07:41:05 by Kent Fredric (kentnl) <kentfredric@gmail.com>
# ABSTRACT: Benchmark difference of return styles

use strict;
use warnings;
use utf8;

sub constant_return() {
    return ( 'is', 'ro' );
}

sub constant_bare() {
    ( 'is', 'ro' );
}

use Benchmark qw( :all :hireswallclock );

cmpthese(
    -2,
    {
        return  => sub { my $x = constant_return },
        bare    => sub { my $x = constant_bare },
        return2 => sub { my $x = constant_return },
        bare2   => sub { my $x = constant_bare },
    }
);

__END__
5.21.1
config_args='-de -Dusecbacktrace -Doptimize=-O3 -march=native -mtune=native -g -ggdb3 -Dusedevel -Accflags=-DUSE_C_BACKTRACE_ON_ERROR -Aldflags=-lbfd

             Rate    bare   bare2 return2  return
bare    3130035/s      --     -1%     -6%     -8%
bare2   3171097/s      1%      --     -5%     -6%
return2 3329940/s      6%      5%      --     -2%
return  3389788/s      8%      7%      2%      --

5.10.1
config_args='-de'

5.18.0
config_args='-de'
             Rate    bare   bare2  return return2
bare    2929449/s      --     -3%     -7%     -9%
bare2   3023864/s      3%      --     -4%     -6%
return  3157930/s      8%      4%      --     -2%
return2 3220760/s     10%      7%      2%      --


5.12.5
config_args='-de'
             Rate    bare   bare2 return2  return
bare    3188585/s      --     -1%     -5%     -5%
bare2   3220761/s      1%      --     -4%     -5%
return2 3339732/s      5%      4%      --     -1%
return  3372640/s      6%      5%      1%      --

