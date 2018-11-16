package Mundi::Oculos::Query::News;

sub new {

  my $class = shift;
  my %args = @_;
  my $self = {};

  $self->{max_per_site} = $args{max_per_site};
  $self->{max} = $args{max};

  bless $self, $class
}

sub get_max {

  my $self = shift;
  $self->{max}
}

sub get_max_per_site {

  my $self = shift;
  $self->{max_per_site}
}
1;
