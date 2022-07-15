#include<stdio.h>
#define k 9

int main(){
    int a[k];
    int i,j,w;

    for ( i = 0; i <k; i++)
    {
        scanf("%d",&a[i]);
    }

    for ( j = 0; j <k; j++){
        for ( i = 0; i<k-j; i++)
        {
            if(a[i]<a[i+1])
            {
            w=a[i];
            a[i]=a[i+1];
            a[i+1]=w;
            }
        }
    }    
    for ( i = 0; i <k; i++)
    {
        printf("%d\t",a[i]);
    }
    return 0;
    
}