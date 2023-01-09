# Reccursive Staircase

```
int climbStairs(int N)
{
	if ( N < 2 )
		return 1
	else return
		climbStairs(N-1) + climbStairs(N-2)
}
```
