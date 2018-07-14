#!/usr/bin/perl
use strict;
use warnings;

my $file = 'comments';
open my $info, $file or die "Could not open $file: $!";

while( my $line = <$info>) 
{   
	$line =~ m/rel=\"category tag\">(.*)<\/a>/g;
	#print "$1\n";
	my $tagline = $1;

	#Line contains more than one category.
	#
	if($tagline =~ m/,/g)
	{
		my @categories = split(',', $tagline);

		foreach my $val (@categories)
		{
			if($val =~ m/rel=\"category tag\">(.*)<\/a>/g)
			{
				print "JOSH: $val\n";
			}
			else
			{
				$val =~ s/<\/a>//g;
				$val =~ s/<a href=\".*\">//g;

				print "$val\n";
			}
 		}	

		#print "comma match\n";
	}

#	last if $. == 2;
}

close $info;
