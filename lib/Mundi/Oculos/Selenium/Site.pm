package Mundi::Oculos::Selenium::Site;

use base 'Mundi::Oculos::Selenium';

use Module::Load;
use threads qw/yield/;
use threads::shared;

sub new {

    my $class = shift;
    my $url = shift;

    my $self = $class->SUPER::new($url);

    $self->{news_links} = [];
    $self->{news_module} = shift || 'Mundi::Oculos::Selenium::News';

    load $self->{news_module};

    bless $self, $class
}

sub set_query {

  my $self = shift;
  $self->{query} = shift;
  $self
}

sub get_news_links {

  my $self = shift;
  @{$self->{news_links}}
}

sub _set_news_links {

  my $self = shift;
  $self->{news_links} = \@_;
  $self
}

sub need_news {

  my $self = shift;
  my @news_links = $self->get_news_links;
  my $max = $self->{query}->get_news_conf->get_max_per_site;

  !(defined $max) || scalar @news_links < $max
}

sub scrap_news {

  my $self = shift;
  my $module = $self->{news_module};

  sub scrap_news_page {

    my ($url, $module) = @_;
    my $news_pag = $module->new($url);

    $news_pag->serialize->record if $news_pag->get;
    $news_pag->close;
  }

  threads->create('scrap_news_page', ($_, $module))
  foreach $self->get_news_links;

  do { yield } while threads->list(threads::running);
}

sub update_news {

  my $self = shift;
  my @elements = @_;
  my @news_links = $self->get_news_links;
  my $max = $self->{query}->get_news_conf->get_max_per_site;

  my $all_links = scalar @elements;
  $all_links = $max if defined $max && $all_links > $max;

  my $current_links = scalar @news_links;
  my $new_links = $all_links - $current_links;

  my @new_news_links = map {
    $_->get_attribute('href')
  } splice @elements, $current_links, $new_links;

  $self->_set_news_links(@news_links, @new_news_links)
}
1;
