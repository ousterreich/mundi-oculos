package Mundi::Oculos::Selenium::Site::G1::SP::SorocabaJundiai;

use base 'Mundi::Oculos::Selenium::Site::G1';

sub new {

    my $class = shift;
    my $self = $class->SUPER::new('https://g1.globo.com/sp/sorocaba-jundiai/');

    bless $self, $class;
}
1;
