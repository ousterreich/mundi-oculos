package Mundi::Oculos::Selenium::Site::G1;

use base 'Mundi::Oculos::Selenium::Site';

my $NEWS_CSS = "
    div.bastian-feed-item[data-type='basico'] .feed-post-link,
    .bstn-hl-link:not(.bstn-related)
";

my $LOAD_MORE_BUTTON_CSS = '.load-more';

sub new {

    my $class = shift;
    my $url = shift || 'https://g1.globo.com';
    my $news_module = 'Mundi::Oculos::Selenium::News::G1';

    my $self = $class->SUPER::new($url, $news_module);
    bless $self, $class
}

sub record_news {

  my $self = shift;

  while ($self->need_news) {

    my @elements = $self->find_elements($NEWS_CSS, 'css');
    $self->update_news(@elements);

    my $load_button = $self->find_element_by_css($LOAD_MORE_BUTTON_CSS);
    last unless $self->need_news && defined $load_button;

    $load_button->click;
    sleep 3;
  }

  $self->close;
  $self->scrap_news;

  $self
}
1;
