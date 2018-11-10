package Mundi::Oculos::Selenium::Site::G1::SP::RioPretoAracatuba;

use base 'Mundi::Oculos::Selenium::Site::G1';

sub new {

    my $class = shift;
    my $self = $class->SUPER::new('https://g1.globo.com/sp/sao-jose-do-rio-preto-aracatuba/');

    bless $self, $class;
}
1;
