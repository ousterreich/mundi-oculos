package Mundi::Oculos::Selenium::Site::G1::SP::RibeiraoFranca;

use base 'Mundi::Oculos::Selenium::Site::G1';

sub new {

    my $class = shift;
    my $self = $class->SUPER::new('https://g1.globo.com/sp/ribeirao-preto-franca/');

    bless $self, $class;
}
1;
