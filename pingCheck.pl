#!/usr/bin/perl

use DBI;
use File::Find;
use Cwd;
use Date::Parse qw(str2time);
use DateTime::Format::Strptime qw( );

require "config.pl";

my $file = 'extrLinks59';
open my $info, $file or die "Could not open $file: $!";
my $x = 0;
my $wc = 0;
my $strQuery = "";

# Connect to the database
$dbh = DBI->connect($dsn, $username, $password);

while( my $line = <$info>)
{
	$line =~ s/[\r\n]+$//;
	$wc = `grep $line extrLinks56 | wc -l`;
	$wc =~ s/[\r\n]+$//;
	$strQuery = "INSERT INTO attrition VALUES('', '$line', '$wc', NULL, NULL)\n";

	# Execute the query
	$sth = $dbh->prepare($strQuery);
        $sth->execute();

	if ( $sth->err )
        {
           die "ERROR! return code: $sth->err error msg: $sth->errstr \n";
        }
	else
	{
        	print "$x: $strQuery ...\n";
	}

#	my $response = `ping -c 1 $line`;

#	if($response =~ m/unknown host/)
#	{
#		print $response;
#	}
#	else
#	{
#		print $response;
#	}

#	if($x > 20)
#	{
#		die;
#	}

	$x = $x + 1;
}
	$dbh->disconnect();	
