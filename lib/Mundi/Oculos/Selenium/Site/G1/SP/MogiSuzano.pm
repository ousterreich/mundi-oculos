package Mundi::Oculos::Selenium::Site::G1::SP::MogiSuzano;

use base 'Mundi::Oculos::Selenium::Site::G1';

sub new {

    my $class = shift;
    my $self = $class->SUPER::new('https://g1.globo.com/sp/mogi-das-cruzes-suzano/');

    bless $self, $class;
}
1;
