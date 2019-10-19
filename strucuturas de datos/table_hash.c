#include <stdlib.h>
#include <stdio.h>
#define SIZE 20
struct data_item *item;
struct data_item *dummy;
/*La funcion hash es una qu nos ayuda a delegar un indice de una matriz en nuestra tabla
 *N°|Key|hash     |indice|
 *1 |1	|1%20=1   |1	 |
 *2 |2	|2%20=2	  |2	 |
 *3 |42	|42%20=2  |2	 |
 *4 |4	|4%20=4   |4	 |
 *5 |12	|12%20=12 |12	 |
 * */
/*Sondeo lineal esto sucede debido a que la tecnica de hashing anterior puede ser que nos de un resulta de un indice que ya esta utilizado
 *como nos muestra el ejemplo de arriba donde el numero 2 y 3 llegan al mismo indice por lo tanto la tecnica del sondeo especifica que
 *siga recooriendo hasta que el indice que se esta en la pocion de l arrary tenfra qu econvertirse en el inidice con esta tecnica el numero 3 
 *llegaria a ser el indice 3
*/

//definimos un tad
struct data_item{
	int data;
	int key;
};
struct data_item *hashArray[SIZE];
//definimosyllabus.un metodo hash para dar referncia a los arrays 
int hashCode(int key){return key%SIZE;}
//Nos guiaremos de acuerdo con el ejemplo de arriba los @ indicaaran 
struct data_item *search(int key)
{	//get hash code
	//@key=42 hashIndex=2 despues de aplicar la hash function
	int hashIndex = hashCode(key);
	//moviendonos hasta que sea diferente de null
	while(hashArray[hashIndex] != NULL)
	{
	if(hashArray[hashIndex]->key == key){
	return hashArray[hashIndex];
	}else{
	//goto next cell
	//hashIndex	=3
	++hashIndex;
	//envolviendo la tabla
	//realmente no es necesario ya n<donde n el una llave>%K->n
	hashIndex=hashIndex%SIZE;		
	}
	}

return NULL;
}

void insert(int key ,int data)
{
struct data_item *item = (struct data_item*)malloc(sizeof(struct data_item));
item->data=data;item->key=key;int hashIndice=hashCode(key);
while(hashArray[hashIndice]!=NULL && hashArray[hashIndice]->key !=-1)
{
++hashIndice;hashIndice=hashIndice%SIZE;
}
hashArray[hashIndice]=item;
}

struct data_item *delete(struct data_item *item){
	int key= item->key;
	int hashkey=hashCode(key);
	while (hashArray[hashkey]!=NULL)
	{
		if (hashArray[hashkey]->key==key)
		{
			struct data_item *tmp=hashArray[hashkey];
			hashArray[hashkey]=dummy;
			return tmp;
		}
		++hashkey;hashkey=hashkey%SIZE;
	}
	return NULL;
}
void display() {
   int i = 0;
	
   for(i = 0; i<SIZE; i++) {
	
      if(hashArray[i] != NULL)
         printf(" (%d,%d)",hashArray[i]->key,hashArray[i]->data);
      else
         printf(" ~~ ");
   }
	
   printf("\n");
}
int main(int argc, char const *argv[])
{
dummy =(struct data_item*) malloc(sizeof(struct data_item));
dummy->key=-1;dummy->key=-1;
insert(1, 20);
   insert(2, 70);
   insert(42, 80);
   insert(4, 25);
   insert(12, 44);
   insert(14, 32);
   insert(17, 11);
   insert(13, 78);
   insert(37, 97);

   display();
   item = search(37);

   if(item != NULL) {
      printf("Element found: %d\n", item->data);
   } else {
      printf("Element not found\n");
   }

   delete(item);
   item = search(37);

   if(item != NULL) {
      printf("Element found: %d\n", item->data);
   } else {
      printf("Element not found\n");
   }
	return 0;
}
						