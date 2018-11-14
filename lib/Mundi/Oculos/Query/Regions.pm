package Mundi::Oculos::Query::Regions;

sub new {

  my $class = shift;
  my $regions = shift || {'*' => '*'};

  my $self = {regions => $regions};
  bless $self, $class
}

sub get_regions {

  my $self = shift;
  %{$self->{regions}}
}

sub match {

  my $self = shift;
  my $path = shift;

  my @dirs = split '/', $path;
  shift @dirs;

  $self->_match_path(\@dirs)
}

sub _match_path {

  my $self = shift;
  my $path = shift;
  my $remaining_regions = shift;

  my %regions = defined $remaining_regions
  ? %{$remaining_regions}
  : $self->get_regions;

  return 1 if scalar grep { $_ eq '*' } keys %regions;

  my $region = shift @{$path};
  return 0 unless scalar grep { $_ eq $region } keys %regions;

  scalar @{$path} > 0
  ? $self->_match_path($path, $regions{$region})
  : 1
}
1;
