#!/usr/bin/perl

use DBI;
use File::Find;
use Cwd;
use MIME::Base64;

require "config.pl";

		my $strLimit = " LIMIT 0, 1000";

		my @arrRecordSet = [];
		my $x = 0;
		my $strPingData = "";
		my $strHostedAt = "";

		# Connect to the database
                $dbh = DBI->connect($dsn, $username, $password) or die $DBI::errstr;

		my $strQuery = "SELECT intSiteID, strUrl FROM attrition WHERE strPingData IS NULL OR strPingData = '' $strLimit";
		$sth = $dbh->prepare($strQuery);
                $sth->execute();
		if ( $sth->err )
		{
		  die "ERROR! return code: $sth->err error msg: $sth->errstr \n";
		}
		
		while(my @record = $sth->fetchrow_array())
		{
			my $response = `ping -c 1 $record[1] 2>/dev/null`;

		        if($response =~ m/unknown host/ or $response eq "")
		        {
				$strQuery = "UPDATE attrition SET strPingData='unknown host' WHERE intSiteID='$record[0]'";
        		}
        		else
        		{
				$strPingData = $response;
				$strPingData =~ m/64 bytes from (.*):/g;
				$strQuery = "UPDATE attrition SET strPingData='$1' WHERE intSiteID='$record[0]'";
        		}
			
			#print "$x $strQuery ...\n";
			$sth2 = $dbh->prepare($strQuery);
	                $sth2->execute();

			if ( $sth2->err )
			{
				die "ERROR! return code: $sth->err error msg: $sth->errstr \n";
			}
			else
			{
				print "$x $strQuery ...\n";
			}

			$x = $x + 1;
		}

		# Finish up and disconnect 
		$sth->finish();
		$sth2->finish();

	        # Disconnect from the db
        	$dbh->disconnect();

		close(FILE);
