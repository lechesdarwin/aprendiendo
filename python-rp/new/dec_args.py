import functools as f

def dec_arg(hola):
    print("called from dec_arg")
    def dec(fn):
        print("called from dec")
        @f.wraps(fn)
        def _dec(*args,**kargs):
            print("called from _dec")
            fn_return = fn(*args,**kargs)
            print("exit from _dec")
            return fn_return
        print("exit from dec")
        return _dec
    print("el param es",hola)
    print("exit from dec_arg")
    return dec
@dec_arg("decorador puto")
def test(a):
    print("called from test")
    print("arg is ", a)
    print("exit from test")
    return 0

test(999999999)
called from dec_arg
el param es decorador puto
exit from dec_arg
called from dec
exit from dec
called from _dec
called from test
arg is  999999999
exit from test
exit from _dec
