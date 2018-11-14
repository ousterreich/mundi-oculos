package Mundi::Oculos::Query;

use Mundi::Oculos::Query::Regions;

sub new {

  my $class = shift;
  my $self = {};
  my %args = @_;

  $self->{regions} = Mundi::Oculos::Query::Regions->new(
    $args{regions}
  );

  bless $self, $class
}

sub regions {

  my $self = shift;
  $self->{regions}
}
1;
