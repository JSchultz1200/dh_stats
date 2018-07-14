#!/usr/bin/perl

use DBI;
use File::Find;
use Cwd;

use HTML::LinkExtractor;

my $file = 'total-user-comments';
open my $info, $file or die "Could not open $file: $!";
my $x = 0;

while( my $line = <$info>)
{   

 my $LX = new HTML::LinkExtractor(undef,undef,1);
 $LX->parse(\$line);
 for my $Link( @{ $LX->links } ) {
	#if(!$$Link{href}=~ m/dreamhost/ ) {
            print "\n LinkText $$Link{_TEXT} URL $$Link{href}\n";
	#}
    }

$x = $x + 1;

if($x>15300)
{
	die;
}
}
