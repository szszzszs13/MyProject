#include<stdio.h>

int main(){
    int i,j,col=0,max,row=0;

    int a[3][4] = {{3,4,16,2},{7,5,1,9},{11,23,3,8}};

    max = a[0][0];
    for ( j = 0; j < 3; j++)  //rows
    {
        for ( i = 0; i < 4; i++) //cols
        {
            if (a[j][i]>max)
            {
                max=a[j][i];
                col=i;
                row=j;
            }
            
        }
        
    }
    printf("���ֵ��:%d,�ڵ�%d��,��%d��",max,row,col);
    return 0;
    
}