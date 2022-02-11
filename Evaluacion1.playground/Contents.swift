//Creado Por: Ramon Felix. Marzo 15 2020
import UIKit

var rango = 0...100

for i in rango{
    if i%5 == 0
    {
    print("\(i)\tBingo!!!")
    }
    else if i%2==0 {
        print("\(i)\tPar!!!")
    }
    else if i%2>0{
        print("\(i)\tInPar!!!")
    }
    if i>=30 && i<=40{
        print("\(i)\tViva Swift!!!")
    }
}
