package Mundi::Oculos::Selenium::Site::G1::SP::Prudente;

use base 'Mundi::Oculos::Selenium::Site::G1';

sub new {

    my $class = shift;
    my $self = $class->SUPER::new('https://g1.globo.com/sp/presidente-prudente-regiao/');

    bless $self, $class;
}
1;
