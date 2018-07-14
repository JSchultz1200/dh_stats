#!/usr/bin/perl

use DBI;
use File::Find;
use Cwd;
use MIME::Base64;

require "config.pl";
		open (FILE, ">> total-user-comments") || die "problem opening $outfile\n";

		my @arrRecordSet = [];
		my $x = 0;

		# Connect to the database
                $dbh = DBI->connect($dsn, $username, $password) or die $DBI::errstr;

		my $strQuery = "SELECT intStatusID, strUrl FROM stats WHERE textHTML = '' OR textHTML IS NULL;";
		$sth = $dbh->prepare($strQuery);
                $sth->execute();
		if ( $sth->err )
		{
		  die "ERROR! return code: $sth->err error msg: $sth->errstr \n";
		}
		
		while(my @record = $sth->fetchrow_array())
		{
			push (@arrRecordSet, [@record]);
			my $strHTML = `wget -qO- $record[1]`;
			my $strSmart =  encode_base64($strHTML);

			$strQuery = "UPDATE stats SET textHTML='$strSmart' WHERE intStatusID=$record[0]";
			$sth2 = $dbh->prepare($strQuery);
	                $sth2->execute();

			if ( $sth2->err )
			{
				die "ERROR! return code: $sth->err error msg: $sth->errstr \n";
			}
			else
			{
				print FILE $strHTML;

	                        print "$x ... Updating Record for $record[1] \n";
        	                sleep 2;
			}

			$x = $x + 1;
		}

		# Finish up and disconnect 
		$sth->finish();

	        # Disconnect from the db
        	$dbh->disconnect();

		close(FILE);
