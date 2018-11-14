package Mundi::Oculos::News;

sub new {

  my $class = shift;
  bless {}, $class;
}

sub link {

  my $self = shift;

  $self->{link} = shift
  if scalar @_;

  return $self->{link};
}

sub title {

  my $self = shift;

  $self->{title} = shift
  if scalar @_;

  return $self->{title};
}

sub subtitle {

  my $self = shift;

  $self->{subtitle} = shift
  if scalar @_;

  return $self->{subtitle};
}

sub time {

  my $self = shift;

  $self->{time} = shift
  if scalar @_;

  return $self->{time};
}

sub text {

  my $self = shift;

  $self->{text} = shift
  if scalar @_;

  return $self->{text};
}
1;
