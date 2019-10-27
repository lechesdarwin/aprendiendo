#include <stdio.h>
class A
{
private:
    /* data */
public:
int i;
    A(int);
    ~A();
};
A::A(int a)
{
i=a;
}
A::~A()
{
}

int main(int argc, char const *argv[])
{
    A a(10);
    printf("%d",a.i);
    return 0;
}
