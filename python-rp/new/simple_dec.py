import functools as f

def dec(fn):
    print("call from dec")
    @f.wraps(fn)
    def _dec(*args,**kargs):
        print("call from _dec")
        fn_return = fn(*args,**kargs)
        print("exit from _dec")
        return fn_return
    print("exit from dec")
    return _dec

@dec
def test(a):
    print("called from test")
    print(a)
    print("exit from test")
    return 0

test(99999999999999999)
#call from dec
#exit from dec
#call from _dec
#called from test
#99999999999999999
#exit from test
#exit from _dec

