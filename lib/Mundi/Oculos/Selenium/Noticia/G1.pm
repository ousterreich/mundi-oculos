package Mundi::Oculos::Selenium::Noticia::G1;

use base 'Mundi::Oculos::Selenium::Noticia';

use Mundi::Oculos::Noticia;

sub serialize {

  my $self = shift;

  my $noticia = Mundi::Oculos::Noticia->new;
  $noticia->link($self->url);

  my $html_titulo = $self->find_element_by_css('.content-head__title');
  $noticia->titulo($html_titulo->get_text) if $html_titulo;

  my $html_subtitulo = $self->find_element_by_css('.content-head__subtitle');
  $noticia->subtitulo($html_subtitulo->get_text) if $html_subtitulo;

  my $html_tempo = $self->find_element_by_css('time:first-child');
  $noticia->tempo($html_tempo->get_attribute('datetime', 1)) if $html_tempo;

  my @html_texto = $self->find_elements('p.content-text__container', 'css');

  my $texto = '';
  $texto .= " $_ " foreach map { $_->get_text } @html_texto;
  $texto =~ s/\s{2}/ /g;

  $noticia->texto($texto);

  return $noticia;
}
1;
