class Power {
  
    [int]Pow([int] $base, [int] $exp) {
        return [math]::Pow($base, $exp)
    }
}
$result1 = [Power]::new()
$result1.Pow(2, 8)