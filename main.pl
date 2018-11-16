#!/usr/bin/perl -w

use 5.22.1;
use warnings;

use lib './lib';
use Mundi::Oculos;

my $mundi = Mundi::Oculos->new;
$mundi->set_query(
  '-regions' => {'*' => '*'},
  '-news' => {max_per_site => 2}
);

use Data::Dumper;
die Dumper $mundi->run;
