#!/bin/bash

tr '[:upper:]' '[:lower:]' < extrLinksJosh.txt > extrLinks27

grep -v "hotmail.com" extrLinks27 > extrLinks28
grep -v "msn.com" extrLinks28 > extrLinks29
grep -v "google.com" extrLinks29 > extrLinks30
grep -v "google.cn" extrLinks30 > extrLinks31
grep -v "\[" extrLinks31 > extrLinks32
grep -v "Hosting.com" extrLinks32 > extrLinks33
grep -v "yourname.com" extrLinks33 > extrLinks34
grep -v "aol.com" extrLinks34 > extrLinks35
grep -v "gblx.net" extrLinks35 > extrLinks36
grep -v "Level3.net" extrLinks36 > extrLinks37
grep -v "qwest.net" extrLinks37 > extrLinks38
grep -v "charter.com" extrLinks38 > extrLinks39
grep -v "pnap.net" extrLinks39 > extrLinks40
grep -v "_" extrLinks40 > extrLinks41
grep -v "1and1.com" extrLinks41 > extrLinks42
grep -v "linode.com" extrLinks42 > extrLinks43
grep -v "hostgator.com" extrLinks43 > extrLinks44
grep -v "liquidweb.com" extrLinks44 > extrLinks45
grep -v "bluehost.com" extrLinks45 > extrLinks46
grep -v "mail" extrLinks46 > extrLinks47
grep -v ".ntt.net" extrLinks47 > extrLinks48
grep -v "covad.net" extrLinks48 > extrLinks49
grep -v ".xo.net" extrLinks49 > extrLinks50
grep -v ".internap.net" extrLinks50 > extrLinks51
grep -v "twtelecom.net" extrLinks51 > extrLinks52
grep -v "cogentco.com" extrLinks52 > extrLinks53
grep -v "above.net" extrLinks53 > extrLinks54
grep -v "dreamhoststatus.com" extrLinks54 > extrLinks55
grep -v "blogspot.com" extrLinks55 > extrLinks56
