#include <stdlib.h>
#include <stdio.h>
struct c{int flag:4;};
int main(int argc, char const *argv[])
{
	struct c a;
	//
	printf("%d",sizeof(a));
	printf("%d",sizeof(struct c));
	return 0;
}
