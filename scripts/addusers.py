#!/usr/bin/env python

import csv, os, sys, optparse
from subprocess import check_output
import unicodecsv as csv

opt_parser = optparse.OptionParser()
opt_parser.add_option('-c', '--csv', dest='csv', type='str', action='store', default=None, help='CSV file')
opt_parser.add_option('-w', '--wordpress', dest='wordpress', type='str', action='store', default=None, help='WordPress directory')
options, args = opt_parser.parse_args()

if os.getuid() != 0 or not options.csv or not options.wordpress:
	print('Usage: sudo addusers.py --csv [file] --wordpress [dir]')
	sys.exit(1)

try:
	file = open(options.csv, 'r')
	reader = csv.reader(file)
except:
	print('Could not open CSV file %s' % sys.argv[1])
	sys.exit(1)

def csv_record(row, headers):
	col_num = 0
	record = {}
	for key in headers:
		record[key] = row[col_num]
		col_num = col_num + 1
	return record

headers = []
row_num = 0

for row in reader:

	row_num = row_num + 1

	if row_num == 1:
		headers = row
		continue

	record = csv_record(row, headers)
	print("Adding user %s" % record['username'])

	cmd = [
		'./adduser_login.sh',
		options.wordpress,
		record['username'],
		record['email'],
		record['name']
	]
	out = check_output(cmd).strip()
	print("  %s" % out)

	cmd = [
		'./adduser_wordpress.sh',
		options.wordpress,
		record['username'],
		record['email'],
		record['name']
	]
	out = check_output(cmd).strip()
	print("  %s" % out)

print('Done')
