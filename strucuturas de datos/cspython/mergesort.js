
var arr = [0,8,22,4,1,-42]
var helperarray = []
function mergesort(low,hight){
    if(low < hight){
        mid = parseInt((low+hight)/2)
        mergesort(low,mid)
        mergesort(mid+1,hight)
        merge(low,mid,hight)
    }else{
        return
    }

}
function merge(low,mid,hight){
    var l1 ,l2,i;
    for(l1=low,l2=mid+1,i=low;l1<=mid && l2<=hight;i++){
    if(arr[l1]<= arr[l2]){
        helperarray[i++] = arr[l1++]
    }else{
        helperarray[i++] = arr[l2++]
    }
    }
    while(l1 <= mid){
        helperarray[i++] = arr[l1++]
    }
    while(l2 <= hight){
        helperarray[i++] = arr[l2++]
    }
    // copy
    for(i = low;i<=hight;i++){
        arr[i]=helperarray[i]
    }
}
mergesort(0,arr.length-1)
console.log(arr)
