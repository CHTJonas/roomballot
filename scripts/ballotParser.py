#!/usr/bin/python

import csv
import random
import argparse

parser = argparse.ArgumentParser(description="Generate files required for roomballot.fitzjcr.com");
parser.add_argument("file", type=str, nargs=1, help="An input .csv, from Accommodation Office");
parser.add_argument("--authgroup", dest="authgroup", default=False, help="Generate authgroups instead of DB-ready csv");

args = parser.parse_args();

priority = {
  "1": "FIRSTYEAR",
  "2": "SECONDYEAR",
  "3": "THIRDYEAR"
}

with open(args.file[0], "rb") as csvfile:
  csvreader = csv.DictReader(csvfile, delimiter=",",quotechar='"')
  if args.authgroup:
    values = []
    for row in csvreader:
      values.append(row["CRS Id Email"].split("@")[0])
    print "FitzUgrad: "+" ".join(values)

  else:
    for row in csvreader:
      values = [
        "%d" % round(random.uniform(0, 2147483647)), #PHP_INT_MAX
        '"'+row["First Name"]+" "+row["Surname"]+'"',
        '"'+row["CRS Id Email"].split("@")[0]+'"',
        "NULL",
        "0",
        "NULL",
        '"'+priority[row["Year 17-18 "]]+'"'
      ];
      print ",".join(values)
