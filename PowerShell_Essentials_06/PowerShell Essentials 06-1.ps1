$str1 = "xyaabbbccccdefww"
$str2 = "xxxxyyyyabklmopq"

#convert 2 variables to array
$str3 = $str1.ToCharArray() + $str2.ToCharArray()

#sort array
[array]::sort($str3)

#remove all duplicate strings 
$str3 = $str3 | Select-Object -Unique
$str3 -join ""