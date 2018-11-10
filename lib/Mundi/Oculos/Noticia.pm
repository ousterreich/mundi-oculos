package Mundi::Oculos::Noticia;

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

sub titulo {

  my $self = shift;

  $self->{titulo} = shift
  if scalar @_;

  return $self->{titulo};
}

sub subtitulo {

  my $self = shift;

  $self->{subtitulo} = shift
  if scalar @_;

  return $self->{subtitulo};
}

sub tempo {

  my $self = shift;

  $self->{tempo} = shift
  if scalar @_;

  return $self->{tempo};
}

sub texto {

  my $self = shift;

  $self->{texto} = shift
  if scalar @_;

  return $self->{texto};
}
1;
