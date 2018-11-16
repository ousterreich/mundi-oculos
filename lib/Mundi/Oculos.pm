package Mundi::Oculos;

use Module::Load;
use aliased 'Mundi::Oculos::Query';
use aliased 'Mundi::Oculos::Geography';

sub new {

	my $class = shift;
	my $self = {
		query => undef,
		news => []
	};

	bless $self, $class
}

sub set_query {

	my $self = shift;
	my %args = @_;

	my $regions = $args{'-regions'};
	my $news = $args{'-news'};

	$self->{query} = Query->new(
		regions => $regions,
		news => $news
	);

	$self
}

sub get_news {

	my $self = shift;
	@{$self->{news}}
}

sub run {

	my $self = shift;
	my @news_sites = Geography->get_news_sites($self->{query});

	my %modules;

	foreach my $news_site (@news_sites) {

		my $path = $news_site->{path};
		my $news_module = $news_site->{news_module};

		$modules{$news_module} = []
		unless (defined $modules{$news_module});

		push @{$modules{$news_module}}, $path
		unless scalar grep { $_ eq $path } @{$modules{$news_module}};
	}

	my @news;

	foreach (keys %modules) {

		my $module = "Mundi::Oculos::Selenium::Site::$_";
		load $module;

		my $module_instance = $module->new();
		$module_instance->set_query($self->{query});
		$module_instance->get;

		push @news, $module_instance->record_news;
	}

	@news
}

1;
