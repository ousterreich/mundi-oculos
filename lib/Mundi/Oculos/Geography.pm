package Mundi::Oculos::Geography;

use IO::File;
use Carp qw/croak/;

our $DATA_DIR = 'world-news';

sub get_news_sites {

  my $self = shift;
  my $query = shift;
  my $dir = shift || $DATA_DIR;

  my @news;

  opendir(my $dh, $dir) || croak "Sorry, there is an error: $!";
  my @dir_archives = grep { /^[^\.]/ } readdir $dh;
  closedir $dh;

  my @dir_readable_files = grep {
    /\.txt$/ && -f "$dir/$_" && -r "$dir/$_"
  } @dir_archives;

  if (scalar @dir_readable_files > 0) {

    foreach my $filename (@dir_readable_files) {

      my $news_fp = IO::File->new("< $dir/$filename")
      || croak "Sorry, there is an error: $!";

      while (<$news_fp>) {

        if (scalar split '' ) {

          $_ =~ s/\n//g;

          my $push = {
            path          => $dir,
            news_module   => $_
          };
          push @news, $push;
        }
      }

      $news_fp->close;
    }
  }

  if (-e $dir && -d $dir && -x $dir) {

    my @news_dirs = grep {
      -d "$dir/$_" && $query->get_regions_conf->match("$dir/$_")
    } @dir_archives;

    foreach my $news_dir (@news_dirs) {

      push @news, $_
      foreach $self->get_news_sites($query, "$dir/$news_dir");
    }
  }

  @news
}
1;
