//
//  main.swift
//  control flow
//
//  Created by home on 07/02/22.
//  Copyright © 2022 RF. All rights reserved.
//

import Foundation

var myCounter = 5

repeat
{
    print("\(myCounter)")
    myCounter-=1
}while(myCounter>0)

var counterTwo = 2
while (counterTwo<10)
{
    print("\(counterTwo)")
    counterTwo+=1
}

var myInt = 1

for anyChar in "hola"
{
    print("\(anyChar)")
}

for i in 0..<10
{
    print("\(i)")
}
for i in stride(from: 0, to: 100, by: 15)
{
    print("two by two \(i)")
}


switch myInt {
case 1:
    print("one")
default:
    print("otra cosa")
}

if (myInt == 21)
{
    print("veintiuno")
}

