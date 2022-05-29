Copyright 2022 Dobrica Nicoleta Adriana 311CA

This program implements the Page Rank algorithm in two different methods:

ITERATIVE:
-> After reading the input from the given file, I create my adjancecy matrix.
To apply the iterative formula, I need another matrix, which will have its 
elements like this: M(i,j) = 1/(the out degree of node j), if j has a link to i,
and 0 otherwise. 
-> As it is an iterative formula, we need two column vectors, so as to compare if
the absolute(or the norm) of the difference between our two steps is lesser than 
a given error. 

ALGEBRAIC:
-> This is mainly similar to the Iterative function, because we need the matrix 
with the out degrees of each node for the formula, only we are not going to use 
this formula repeatedly, as it's not an iterative one, but only once. 
-> The difference between the algebraic and the iterative algorithm is that the
algebraic one needs to calculate the inverse of a matrix, which will be done with 
the help of the modified Gram-Schmidt algorithm. 
-> The difference between modified Gram-Schmidt and simple Gram-Schmidt is that the 
modified one is numerically stronger. This algorithm gets our matrix, e.g. T, and 
partitions it into two matrices, Q and R, where R is a superior triungular matrix.
-> These two new matrices, Q and R, are going to be useful in finding the inverse
of our matrix T. 
-> As we already know, T = QR based on the Gram-Schmidt algorithm. So, inv(T) * T =
inv(T) * Q * R => inv(T) * Q * R = In => R * inv(T) = inv(Q) which is equal to
R * inv(T) = Q_transposed. The last formula is the one we need to solve a system
of equations to help us find out the inverse of T.

PAGE RANK:
->This function prints the Iterative and Algebraic PR column vectors into an output
file. Also, we sort our Algebraic PR column vector (in decreasing order) and we pass
this PR1 vector into a member function, called u(x). The values a and b from this
member function are found by calculating the lateral limits of the said function.