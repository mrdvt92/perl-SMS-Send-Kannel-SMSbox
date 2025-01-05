#!/usr/bin/perl
use strict;
use warnings;
use Plack::Runner;

my $runner = Plack::Runner->new;
$runner->parse_options('--port' => 13013);
my $return = '0: ok';
my $app    = sub {[200 => [] => [$return]]};
$runner->run($app);
