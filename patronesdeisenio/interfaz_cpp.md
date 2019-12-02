Las interfaces son un control son algo que definen un comportamineto muy importante que tambien son un tipo
el cpp existen direferentes tipos de interfaces 
Sedice que un metodod es abstracto puro cuado tiene la firma =0 {int somename(int ,float)=0}
las clases abstractas no pueden ser instanciados
+ las mixtas
    + son interfaces que tienen una mescla de metodos totalmente purosy y no 
    + estas pueden ser incorparado facilmete al codigo fuente
+ las puras o clases abstractas
    + todos sus metodos son virtuales puros

enum color {
    red,
    yellow,
    green = 20,
    blue
};
// altitude may be altitude::high or altitude::low
enum class altitude : char { 
high='h',
low='l', // C++11 allows the extra comma
}; 
// the constant d is 0, the constant e is 1, the constant f is 3
enum { d, e, f=e+2 };
int main()
{
color col = red;
altitude a;
a = altitude::low;
         
std::cout << "red = " << col << " blue = " << blue << '\n'
 << "a = " << static_cast<char>(a) << '\n'
 << "f = " << f << '\n';
}>>>>>>>>>>>>>>>>>>>>>>}
class derivada : public base1, public base2 {

public:

 /* el constructor en derivada no usa parametros,
   pero aun asi debe ser declarado para tomarlos
    y pasarselos a las clases base.
   */
   derivada(int x, int y) : base1(x), base2(y) 
    { cout << "Construyendo derivada\n"; }
       
    ~derivada() { cout << "Destruyendo derivada\n"; }
      void mostrar() { cout << i << "" << k << "\n"; }
  };
          
 int main()
 {
 derivada obj(3, 4);
            
 obj.mostrar();   // mostrar 3  4
                   
 return 0;
 }
