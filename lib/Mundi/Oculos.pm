package Mundi::Oculos;

our @regioes = qw/
	BauruMarilia
	Campinas
	Itapetininga
	MogiSuzano
	Piracicaba
	Prudente
	RibeiraoFranca
	RioPretoAracatuba
	Santos
	SaoCarlos
	SaoPaulo
	SorocabaJundiai
	ValeParaiba
/;

sub new {

	my $class = shift;
	bless {noticias => []}, $class;
}

sub noticias {

	my $self = shift;

	if (@_) {

		$self->{noticias} = \@_;
	}

	@{$self->{noticias}};
}

sub add_noticia {

  my $self = shift;
  my $noticia = shift;
  my @noticias = $self->noticias;

  use Data::Dumper;
  die Dumper @noticias;

  push @noticias, $noticia;
  $self->noticias(@noticias);
}

sub scrapping_sites {

	my $self = shift;

	use Mundi::Oculos::Selenium::Site::G1::SP::BauruMarilia;
	my $site_g1 = Mundi::Oculos::Selenium::Site::G1::SP::BauruMarilia->new;

	$site_g1->get;
	my $res = $site_g1->carregar_noticias;

	if ($res) {

		$self->add_noticia($_)
		foreach $site_g1->noticias;
	}

	return $self->noticias;
}

1;
