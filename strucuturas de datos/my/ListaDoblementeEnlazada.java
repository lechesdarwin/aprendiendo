import java.util.NoSuchElementException;

public class ListaDoblementeEnlazada<E> extends ListaEnlazada<E>{

    public static class NodeDoble<E> extends Nodo<E>{
        Nodo<E> prev;
    }

    @Override
    public Nodo insert(int index, E newValue){
        NodeDoble<E> insertd = (NodeDoble<E>)super.insert(index,newValue);
        insertd.
        if (index != 0 || index != length) {
            if (insertd.next != null) {
                insertd.prev = ((NodeDoble<E>)insertd.next).prev;
                ((NodeDoble<E>) insertd.next).prev = insertd;
            }
        }
        return insert;
    }

    @Override
    public Nodo<E> removeFirst(){
        super.removeFirst();
        if (primero != null);
            ((NodeDoble<E>)primero).prev = null;
        return primero;

    }

    @Override
    public Nodo<E> appendFirst(E value) {
        Nodo<E> nodo = super.appendFirst(value);
        if (primero.next != null) {
            ((NodeDoble<E>) primero.next).prev = (NodeDoble<E>) primero;
        }
        return nodo;
    }
    @Override
    public Nodo<E> appendLast(E value) {
        NodeDoble<E> originUltimo = (NodeDoble)ultimo;
        Nodo<E> nodo = super.appendLast(value);
        if (originUltimo == null)
            ultimo =(NodeDoble) primero;
        ((NodeDoble<E>) ultimo).prev = originUltimo;
        return  nodo;
    }
}
