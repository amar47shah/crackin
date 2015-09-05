// VI.1, p. 55
// product(a, b) == a * b
// Running time is O(b)
int product(int a, int b) {
  int sum = 0;
  for (int i = 0; i < b; i++) {
    sum += a;
  }
  return sum;
}

// VI.2, p. 55
// power(a, b) == a^b
// Running time is O(b)
int power(int a, int b) {
  if (b < 0) {
    return 0;
  } else if (b == 0) {
    return 1;
  } else {
    return a * power(a, b - 1);
  }
}

// VI.3, p. 56
// mod(a, b) == a % b
// Running time is O(1)
int mod(int a, int b) {
  if (b <= 0) {
    return -1;
  }
  int div = a / b;
  return a - div * b;
}

// VI.4, p. 56
// Integer division
// Runtime is O(a/b)
int div(int a, int b) {
  int count = 0;
  int sum = b;
  while (sum <= a) {
    sum += b;
    count++;
  }
  return count;
}

// VI.5, p. 56
// Integer square root,
// or -1 if not a perfect square
// Runtime is O(log n)
int sqrt_helper(int n, int min, int max) {
  if (max < min) return -1; // no square root

  int guess = (min + max) / 2;
  if (guess * guess == n) { // found it!
    return guess;
  } else if (guess * guess < n) { // too low
    return sqrt_helper(n, guess + 1, max); // try higher
  } else { // too high
    return sqrt_helper(n, min, guess - 1);
  }
}

int sqrt1(int n) {
  return sqrt_helper(n, 1, n);
}

// VI.6, p. 56
// Integer square root, -1 if not perfect square
// Runtime is O(√n)
int sqrt2(int n) {
  for (int guess = 1; guess * guess <= n; guess++) {
    if (guess * guess == n) {
      return guess;
    }
  }
  return -1;
}

// VI.7, p. 57
// If a binary search tree is not balanced, how long might it take (worst case)
// to fins an element in it?
//
// Answer: O(n). If the BST is completely unbalanced, then it will either have
// no nodes with left-children or no nodes with right-children. The only leaf
// node will be either the maximum or minimum element, and finding this element
// will require searching through all the other nodes first.

// VI.8, p. 57
// You are looking for a specific value in a binary tree, but the tree is not
// a binary search tree. What is the time complexity of this?
//
// Answer: O(n). There's no ordering so you may have to look at all the nodes
// before you find the target.
