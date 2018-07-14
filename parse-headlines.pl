#!/usr/bin/perl
use strict;
use warnings;

my $file = 'headlines';
open my $info, $file or die "Could not open $file: $!";

while( my $line = <$info>) 
{   
	$line =~ m/<a href=\"(.*)\" rel/;
	print "$1\t";

	$line =~ m/title=\"(.*)\">/;
	print "$1\n";

#	last if $. == 2;
}

close $info;
