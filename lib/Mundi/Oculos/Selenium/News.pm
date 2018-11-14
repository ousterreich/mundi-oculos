package Mundi::Oculos::Selenium::News;

use base 'Mundi::Oculos::Selenium';

sub get_title {

  my $self = shift;
  $self->_get_unique_element_text('title')
}

sub get_subtitle {

  my $self = shift;
  $self->_get_unique_element_text('subtitle')
}

sub get_time {

  my $self = shift;
  $self->_get_unique_element_text('time')
}

sub get_text {

  my $self = shift;
  $self->_get_multiple_elements_text('text')
}

sub _get_unique_element_text {

  my $self = shift;
  my $element = shift;
  my $css = $self->{"css_$element"};

  if (defined $css) {

    my $el = $self->find_element_by_css($css);
    return $el->get_text if $el;
  }

  undef
}

sub _get_multiple_elements_text {

  my $self = shift;
  my $element = shift;
  my $css = $self->{"css_$element"};

  if (defined $css) {

    my @elements = $self->find_elements($css, 'css');

    if (scalar @elements) {

      my $text = '';
      $text .= " $_ " foreach map { $_->get_text } @elements;
      $text =~ s/\s{2}/ /g;
      return $text;
    }
  }

  undef
}

sub _get_unique_element_attr {

  my $self = shift;
  my $element = shift;
  my $css = $self->{"css_$element"};

  if (defined $css) {

    my $el = $self->find_element_by_css($css);

    if ($el) {

      my $attribute = shift;
      return $el->get_attribute($attribute, 1);
    }
  }

  undef
}

sub serialize {

  my $self = shift;

  Mundi::Oculos::News->new(
    -link       => $self->url,
    -text       => $self->get_text,
    -time       => $self->get_time,
    -title      => $self->get_title,
    -subtitle   => $self->get_subtitle
  )
}
1;
