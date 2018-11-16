package Mundi::Oculos::News;

use base 'Mundi::Oculos::DB';

sub new {

  my $class = shift;
  my %args = @_;
  my $self = $class->SUPER::new;

  $self->{link} = $args{'-link'};
  $self->{text} = $args{'-text'};
  $self->{time} = $args{'-time'};
  $self->{title} = $args{'-title'};
  $self->{subtitle} = $args{'-subtitle'};

  bless $self, $class
}

sub link {

  my $self = shift;

  $self->{link} = shift
  if scalar @_;

  return $self->{link}
}

sub title {

  my $self = shift;

  $self->{title} = shift
  if scalar @_;

  return $self->{title}
}

sub subtitle {

  my $self = shift;

  $self->{subtitle} = shift
  if scalar @_;

  return $self->{subtitle}
}

sub time {

  my $self = shift;

  $self->{time} = shift
  if scalar @_;

  return $self->{time}
}

sub text {

  my $self = shift;

  $self->{text} = shift
  if scalar @_;

  return $self->{text}
}
1;
