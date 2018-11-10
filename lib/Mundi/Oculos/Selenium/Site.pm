package Mundi::Oculos::Selenium::Site;

use base 'Mundi::Oculos::Selenium';

sub new {

  my $class = shift;

  my $self = $class->SUPER::new(@_);
  $self->{noticias} = [];

  bless $self, $class;
}

sub noticias {

  my $self = shift;

  if (scalar @_) {

    $self->{noticias} = \@_;
  }

  return @{$self->{noticias}};
}

sub add_noticia {

  my $self = shift;
  my $noticia = shift;
  my @noticias = $self->noticias;

  push @noticias, $noticia;
  $self->noticias(@noticias);
}
1;
