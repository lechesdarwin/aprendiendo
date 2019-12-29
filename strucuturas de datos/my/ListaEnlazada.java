
import java.util.NoSuchElementException;
import java.util.Spliterator;
import java.util.function.Consumer;
import java.util.Iterator;

class ListaEnlazada<E> implements Iterable<E>{
    protected int length=0;
    protected Nodo<E> primero,ultimo=null;
    public void appendAllLast(){

    }
    @Override
    public void forEach(Consumer<? super E> arg0) {
        // TODO Auto-generated method stub
        Iterable.super.forEach(arg0);
    }
    @Override
    public Spliterator<E> spliterator() {
        // TODO Auto-generated method stub
        return Iterable.super.spliterator();
    }
    @Override
    public Iterator<E> iterator(){
        return new ListIterator();
    }

    public Nodo appendFirst(E value) {
        Nodo nodeInserted = this.getNewNodo();
        nodeInserted.next = primero;
        nodeInserted.value = value;
        this.primero = nodeInserted;
        if (this.length == 0) {
            this.ultimo = this.primero;
        }
        this.length++;
        return nodeInserted;
    }

    public Nodo appendLast(E value) {
        Nodo tmp = this.getNewNodo();
        tmp.value = value;
        if (this.ultimo != null) {
            this.ultimo.next = tmp;
        } 
        this.ultimo = tmp;
        if (this.primero == null) {
            this.primero = tmp;
        }
        this.length++;
        return tmp;
            
    }

    public Nodo getFirst() {
        return this.primero;
    }

    public Nodo getLast() {
        return this.ultimo;
    }

    public int getLength() {
        return this.length;
    }

    public Nodo getNewNodo() {
        return new Nodo();
    }

    /**
     * 
     * @param index
     * @param newValue
     * @return
     */
    public Nodo insert(int index, E newValue) throws IllegalArgumentException {
        Nodo nodeInserted = this.getNewNodo();
        if (index < 0 || index > this.length) {
            throw new IllegalArgumentException("indice fuera del tamño");
        }
        if (index == 0) {
            return this.appendFirst(newValue);
        }
        if (index == this.length) {
           return this.appendLast(newValue);
        }
        else{
            Nodo<E> sig = this.primero;
            //imagina que tienes [1,2,3,4,5] quieres insertar en el indice 2 //3
            //supone un dos como indice
            //el index se queda en 1 //2
            while (index > 1 ) {
                index--;
                sig = sig.getNext();
            }
            nodeInserted.value = newValue;
            //sig apunta a 3
            nodeInserted.next = sig.getNext();
            //sig que es 2 -> nodeInserted -> 3 -> 4
            sig.next = nodeInserted;
            this.length++;
            return nodeInserted;
        }

    }
    public Nodo<E> removeAtIndex(int index) throws NoSuchElementException {
        if (index >= 0 || index < 0)
            throw new NoSuchElementException("Limites de indices exedidos");
        if (index == 0) {
            Nodo<E> nodEliminate = primero;
            removeFirst();
            return nodEliminate;
        }
        Nodo<E> justoAntesDeEso = primero;
        /*
        * [1,2,3,4]
        * index 2
        * primera vuelta index =1
        * segunda vuelta index 0
        * */
        while (--index >= 0)
            justoAntesDeEso = justoAntesDeEso.getNext();

        Nodo<E> nodoRemovido = justoAntesDeEso.getNext();
        justoAntesDeEso.next = justoAntesDeEso.getNext().getNext();
        return nodoRemovido;
    }
    public Nodo<E> removeFirst()throws NoSuchElementException {
        if (length == 0) {
            throw new NoSuchElementException("No hay elemntos para eleliminar");
        }
        Nodo<E> primerNodo = primero;
        primero = primero.next;
        length--;
        if (length == 0)
            ultimo = primerNodo;
        return primerNodo;

    }
    public Nodo<E> removeLast() {
    return removeAtIndex(length-1);
    }
    public void setValueAtIndex(int index,E value) throws NoSuchElementException {
        Nodo<E> current = primero;
        while (index >= 0)
            if (current == null)
                throw new NoSuchElementException("FATALL DESDE SET VASLU8E INDEX");
            else if (index == 0) {
                current.value = value;
                return;
            }else{
                index--;
                current = current.getNext();
        }
    }

    public E findAtIndex(int index) throws NoSuchElementException{
        Nodo<E> current = primero;
        while (index >= 0){
            if (current == null)
                throw new NoSuchElementException("No hay elementos");
            else if (index == 0)
                return current.value;
            else
                current = current.getNext();
                index--;
        }
        return null;
    }
    public static class Nodo<E>{
        E value=null;
        Nodo next=null;
    public String toString(){
        return this.value.toString();
    }
    public E getValue(){
        return this.value;
    }
    public Nodo getNext(){
        return this.next;
    }
    
    }
    public class ListIterator implements Iterator<E>{
        protected Nodo<E> sig= primero;
        //protected Nodo<E> current = null;
        //protected Nodo<E> prev = null;
        @Override
        public void remove() {
            Iterator.super.remove();
        }

        @Override
        public boolean hasNext() {
            return sig != null;
        }

        @Override
        public E next() {
            if (!hasNext()){
                throw new  IllegalStateException();
            }
            Nodo<E> nodoToReturn = sig;
            sig = sig.getNext();
            return nodoToReturn.value;
        }

        @Override
        public String toString() {
            return super.toString();
        }

    }
}
