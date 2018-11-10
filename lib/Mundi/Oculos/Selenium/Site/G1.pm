package Mundi::Oculos::Selenium::Site::G1;

use base 'Mundi::Oculos::Selenium::Site';

use Mundi::Oculos::Selenium::Noticia::G1;

our @NOTICIAS_GAMBIARRA;

my $CSS_NOTICIAS = "
  div.bastian-feed-item[data-type='basico'] .feed-post-link,
  .bstn-hl-link
";

my $CSS_BARRA_VER_MAIS = '.load-more';

sub new {

    my $class = shift;
    my $url = shift;

    my $self = $class->SUPER::new($url || 'https://g1.globo.com');

    bless $self, $class;
}

sub carregar_noticias {

  my $self = shift;

  my @noticias;

  while (scalar @noticias <= 3) {

    $self->find_element_by_css($CSS_BARRA_VER_MAIS)->click;
    sleep 3;

    @noticias = $self->find_elements($CSS_NOTICIAS, 'css');
  }

  foreach my $html_noticia (splice @noticias, 0, 3) {

    my $link_noticia = $html_noticia->get_attribute('href');
    my $pag_noticia = Mundi::Oculos::Selenium::Noticia::G1->new($link_noticia);

    my $res = $pag_noticia->get;

    push @NOTICIAS_GAMBIARRA, $pag_noticia->serialize if $res;
    # $self->add_noticia($pag_noticia->serialize) if $res;

    $pag_noticia->close;
  }

  return @NOTICIAS_GAMBIARRA;
}
1;
