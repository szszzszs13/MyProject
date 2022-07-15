#include<stdio.h>
#define Money 100

int main(){
    int year,lilv,i;
    float val[5],b;

    printf("请输入利率:");
    scanf("%d",&lilv);
    printf("请输入时间:");
    scanf("%d",&year);

    printf("\nYears");
    for ( i = 0; i < year; i++)
    {
        printf("%6d%",lilv+i); 
        val[i] = Money;
    }
    printf("\n");
    
    for (int nowyear = 1; nowyear <= year; nowyear++)
    {
        printf("%3d",nowyear);
        for ( i = 0; i < 5 ;i++)
        {
            val [i] += (lilv+i) /100.0 *val[i];
            printf("%7.2f", val[i]);   
        }
        printf("\n"); 
    }
    return 0;
}