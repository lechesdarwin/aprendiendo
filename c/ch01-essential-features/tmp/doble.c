#define add(dev)\
    int dev ## _auto = 2;

int main(){
    add(carlos);
    return 0;
}
