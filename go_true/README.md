# Mixed code go and c

Si tu codigo C es complejo lo mejor seria crear una biblioteca statica y vincularla correctamente puedes ir 
[a este enlace](https://golang.org/cmd/cgo/) para obtener mas informacion

```{#go-example-link-c .go .numberLines}
// Este codigo es saltado pero puero puedes verlo mejor en, si ves desde le libro en la página 92 aprox
```

# defer

Esta keyword aplaza la ejecucion del codigo, **el orden de ejecución es 🌐 _LIFO_**

``` {#go-defer-example .go .number .numberLines}
package main
import "fmt"

func a() {

    for i := 3; i>0; i-- {
        defer fmt.Println(i)
    }
}

func main() {
    a() // 1 2 3
}
```

# panic & recover 

Panic **mata o detiene** la gorutuna donde es lanzada solo si se usa just-panic pero si pones un **recover** entonces podras recuperar el control

> Panic no escribe en el servicio de Loggin del sistema operativo, el parametro que recibe es un mensaje, pero puede ser más que eso
> profuncdizaremos más adelante

```{#go-panic-recover .go .numberLines}
package main
import "fmt"
// no se si funcione pero ...

var print = fmt.Print
func a() {
print("En a()")
defer func() {
    if c := recover();c!= nil {
        print("Rcuperado en a()")
    }
}()
b()
print("saliendo de b")
}
func b() {
print("Intro b")
panic("Nos vamos a morir todos!")
print("Exit b")
}
func main() {
    print("Entrando en main()")
    a()
    print("Saliendo de main")
}
```
# El ensamblador de go

como ya dijimos que puedes usar la compilacion cruzada en go <GOOS=ostarget GOARCH=archtarget go build file.go> , estos son las listas de OS y ARCH compatibles con el ensamblador de go

**La lista de los válidos GOOSlos valores incluye android, darwin, dragonfly, freebsd, linux, nacl, netbsd, openbsd, plan9, solaris, windows, y zos. Por otra parte, la lista de los válidos GOARCHlos valores incluye 386, amd64, amd64p32, arm, armbe, arm64, arm64be, ppc64, ppc64le, mips, mipsle, mips64, mips64le, mips64p32, mips64p32le, ppc, s390,s390x, sparc, and sparc64.**

> Si está realmente interesado en el ensamblador Go y desea obtener más información, debe visitar https://golang.org/doc/asm
