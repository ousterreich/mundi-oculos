#!/usr/bin/perl -w

use 5.22.1;
use warnings;

use lib './lib';
use Mundi::Oculos::Selenium::Site::G1::SP::BauruMarilia;
my $site_g1 = Mundi::Oculos::Selenium::Site::G1::SP::BauruMarilia->new;

$site_g1->get;

foreach ($site_g1->carregar_noticias) {

	say "\nLINK:".$_->link."\n";
	say "\nTITULO:".$_->titulo."\n";
	say "\nSUBTITULO:".$_->subtitulo."\n";
	say "\nTEMPO:".$_->tempo."\n";
	say "\nTEXTO:\n".$_->texto;
	say "\n";
}

# my @noticias;

# if ($res) {

# 	foreach my $noticia ($site_g1->noticias) {

# 		use Data::Dumper;
# 		die Dumper $noticia;
# 	}
# }