#!/usr/bin/perl -w

print "Content-type: text/html\n\n";
print "<html><head><title>Опыты с Perl: работа с txt-файлами</title></head><body>";

open (GRADES, 'grades') or die "Can't open file: $!\n";

while ($line = <GRADES>) {
	($student, $grade) = split(' ', $line);
	$grades{$student} .= $grade . ' ';
}

foreach $student (sort keys %grades) {
	($scores, $total) = (0, 0);

	@grades = split(' ', $grades{$student});

	foreach $grade (@grades) {
		$total += $grade;
		$scores++;
	}

	$average = $total / $scores;

	print $student . ': ' . $grades{$student} . "\tСреднее: " . $average . "\n<br />";
}


print "</body></head>";