#!/usr/bin/perl
use strict;
use warnings;

my $file = 'comments5';
open my $info, $file or die "Could not open $file: $!";

while( my $line = <$info>) 
{   
	$line =~ m/>([\d,]+)</;
	print "$1\n";

#	last if $. == 2;
}

close $info;
