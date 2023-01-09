# Maximum sum subarray

```
int max_Subarray_Sum ( int A[] , int n)
{
	int max_sum = 0
	for ( i = 0 to n-1)
	{
		sum=0
		for( j = i to n-1)
		{
			sum = sum + A[j]
			if (sum > max_sum)
            max_sum = sum
		}
	 }
retun max_sum
}
```
