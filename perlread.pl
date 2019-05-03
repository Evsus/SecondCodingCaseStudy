use strict;
use warnings;
use diagnostics;

sub get_count{
    my @array = @_;
    my $count = 0;
    my $index = 0;
    for($array){
        $count += $array[$index];
        $index++;
    }
    return $count;
}

my @array;
my $array_size;
my @tests;
for( my $Test_case = <> ; $Test_case != 0 ; $Test_case-- ){
    if($Test_case < 1 || $Test_case > 8){print "-1"; last}
    my $list = <>;
    push(@tests, $list);
}
while(@tests){ #need to shift test out somewhere
    my($N, $S, $K, $m, $M) = split(/\s/, $test_case);
    #create array
    if($N > 3 && $N < (10 ** 50){
        until($array_size == $N){
            $array_size = push(@array, 1);
        }
    }
    else{print '-1'; next;}
    unless($K > 1 && $K < ($N - 1)){print '-1'; next;}
    my $index = 0;
    while($array_total != $S){
        $array[4] = $array[4] + 1;
        $array_total = get_count(@array);
    }
    #The m's are contraints for how big the array elements are
    my $small_index;
    my $large_index;
    until()
}



