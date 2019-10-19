#include <stdlib.h>
#include <stdio.h>
#define MAX 15
#define len(x)  (sizeof(x) / sizeof((x)[0]))
//para la busqueda binaria siempre el array debe estar ordenado
int array[MAX]={2,4,6,12,14,16,19,21,24,26,31,32,36,39,40};
//testmental1 data = 6
int search(int data)
{
	int limiteInferior,limiteSuperior,mid,index;
	limiteInferior=0;limiteSuperior=14;
	//encontramos la mitad de la mitad
	//mid 7
	//array 21
	while(limiteInferior<=limiteSuperior)
	{
		mid=limiteInferior+(limiteSuperior-limiteInferior)/2;
	printf("%d",mid);
		if(array[mid]==data){
	index=mid;break;
	}else{
	
	if(array[mid]<data){
		//mi dato esta el medio superior traslado mi lower al medio +1
		limiteInferior=mid+1;
		}else{
		//el array postion actual es mayor al dato
		//entonces muevo el upper es igual al medio -1
		limiteSuperior = mid-1;
		}
	}
	}
	return index;

}
int main()
{
int i=search(6);
printf("%d",i);
return 0;
}
