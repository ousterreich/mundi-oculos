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

    bless $self, $class;
}

sub load_news {

  my $self = shift;
  my @news_html;

  while (scalar @news_html <= 3) {

    @news_html = map { $_->get_attribute('href') } $self->find_elements($NEWS_CSS, 'css');

    $self->find_element_by_css($LOAD_MORE_BUTTON_CSS)->click;
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
