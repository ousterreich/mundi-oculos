package Mundi::Oculos::Selenium::News::G1;

use base 'Mundi::Oculos::Selenium::News';

use Mundi::Oculos::News;

sub new {

  my $class = shift;
  my $self = $class->SUPER::new(@_);

  $self->{css_title} = '.content-head__title';
  $self->{css_subtitle} = '.content-head__subtitle';
  $self->{css_time} = 'time:first-child';
  $self->{css_text} = 'p.content-text__container';

  bless $self, $class
}

sub get_time {

  my $self = shift;
  $self->_get_unique_element_attr('time', 'datetime')
}
1;
