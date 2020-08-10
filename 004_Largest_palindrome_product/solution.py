# Using python 3.0

def ispalindrome(x):
    s = str(x)
    return s == s[::-1]


def inverse(x, mod):
    """Compute the modular inverse of x modulo a power of 10.
    Return None if the inverse does not exist.
    This function uses Hensel lifting."""
    a = [None, 1, None, 7, None, None, None, 3, None, 9][x % 10]
    if a == None:
        return a
    while True:
        ax = a*x % mod
        if ax == 1:
            return a
        a = (a * (2 - ax)) % mod


def pal2(n):
    assert n > 2

    # Get a lower bound:
    # If n is even then we can construct a first palindrome.
    # If n is odd we simply guess
    k = n//2
    while True:
        maxf = 10**n - 1
        maxf11 = (maxf - 11) // 22 * 22 + 11
        minf = 10**n - 10**(n-k) + 1
        if 2*k == n:
            best = maxf * minf
            factors = (maxf, minf)
            assert ispalindrome(best)
        else:
            best = minf * minf
            factors = None
        # This palindrome starts with k 9's.
        # Hence the largest palindrom must also start with k 9's and
        # therefore end with k 9's.
        # Thus, if p = x * y is the solution then
        # x * y + 1 is divisible by mod.
        mod = 10**k
        for x in range(maxf11, 1, -22):
            if x * maxf < best:
                break
            ry = inverse(x, mod)
            if ry == None:
                continue
            maxy = maxf + 1 - ry
            for p in range(maxy * x, best, -x * mod):
                if ispalindrome(p):
                    if p > best:
                        best = p
                        y = p//x
                        factors = (x, y)
        if factors:
            return best, factors
        else:
            k -= 1
