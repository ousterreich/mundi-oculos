package Mundi::Oculos::Query;

use Mundi::Oculos::Query::News;
use Mundi::Oculos::Query::Regions;

sub new {

  my $class = shift;
  my $self = {};
  my %args = @_;

  $self->{news_conf} = Mundi::Oculos::Query::News->new(
    %{$args{news}}
  );

  $self->{regions_conf} = Mundi::Oculos::Query::Regions->new(
    $args{regions}
  );

  $self->{max_per_site} = $args{max_per_site} || 10;

  bless $self, $class
}

sub get_regions_conf {

  my $self = shift;
  $self->{regions_conf}
}

sub get_news_conf {

  my $self = shift;
  $self->{news_conf}
}
1;
