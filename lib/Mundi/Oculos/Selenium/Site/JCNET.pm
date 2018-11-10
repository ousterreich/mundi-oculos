package Mundi::Oculos::Selenium::Site::JCNET;

use base 'Mundi::Oculos::Selenium::Site';

my $CSS_ULTIMAS_NOTICIAS = "body > table > tbody > tr:first-child > td:nth-child(2) > table > tbody > tr:nth-child(2) > td >";

sub new {

    my $class = shift;
    my $url = shift;

    my $self = $class->SUPER::new('https://www.jcnet.com.br/ultimas.php');

    bless $self, $class;
}

sub carregar_noticias {

  my $self = shift;

  my @noticias;
}
1;
