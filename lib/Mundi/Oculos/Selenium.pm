package Mundi::Oculos::Selenium;

use base 'Selenium::Chrome';

sub new {

  my $class = shift;

  my $self = $class->SUPER::new;
  $self->{url} = shift;

  bless $self, $class;
}

sub get {

  my $self = shift;
  $self->SUPER::get($self->url);
}

sub url {

  my $self = shift;

  if (scalar @_) {

    my $url = shift;
    $self->{url} = $url;
  }

  return $self->{url};
}
1;
