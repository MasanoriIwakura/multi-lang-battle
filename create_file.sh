#!/bin/bash

echo "Create /fixtures/sample.csv"

for i in {1..20648880} ; do
    echo "a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z"
done > ./fixtures/sample.csv

echo "Success!!"
