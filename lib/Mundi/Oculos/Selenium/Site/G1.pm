package Mundi::Oculos::Selenium::Site::G1;

use base 'Mundi::Oculos::Selenium';

use Mundi::Oculos::Selenium::News::G1;

my $NEWS_CSS = "
    div.bastian-feed-item[data-type='basico'] .feed-post-link,
    .bstn-hl-link:not(.bstn-related)
";

my $LOAD_MORE_BUTTON_CSS = '.load-more';

sub new {

    my $class = shift;
    my $url = shift;

    my $self = $class->SUPER::new($url || 'https://g1.globo.com');
    bless $self, $class
}

sub load_news {

  my $self = shift;

  my @news_html;
  my $old_size = 0;

  while ($old_size < 3) {

    my @elements = $self->find_elements($NEWS_CSS, 'css');
    my $new_size = scalar @elements;

    push @news_html, map {
      $_->get_attribute('href')
    } splice @elements, $old_size, $new_size - $old_size;

    $old_size = $new_size;

    my $load_button = $self->find_element_by_css($LOAD_MORE_BUTTON_CSS);
    last unless $old_size < 3 && defined $load_button;

    $load_button->click;
    sleep 3;
  }

  my @news;

  foreach my $news_link (splice @news_html, 0, 3) {

    my $news_pag = Mundi::Oculos::Selenium::News::G1->new($news_link);

    my $res = $news_pag->get;
    push @news, $news_pag->serialize if $res;
    $news_pag->close;
  }

  @news
}
1;
