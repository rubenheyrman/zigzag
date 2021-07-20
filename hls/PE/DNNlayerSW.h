#ifndef _INCLUDED_DNNLAYERSW_H_
#define _INCLUDED_DNNLAYERSW_H_

#include <iostream>

template<int B, int K, int C, int OY, int OX, int IY, int IX, int FY, int FX, int SY, int SX, int SFY, int SFX, class O_type, class I_type, class W_type>
class DNNlayer
{
public:
  DNNlayer() {}

  void run(O_type ****output,
           I_type ****input,
           W_type ****weight)
  {
    for (int b=0; b<B; b++) {
      for (int k=0; k<K; k++){
        for (int c=0; c<C; c++){
          for (int oy=0; oy<OY; oy++){
            for (int ox=0; ox<OX; ox++){
              for (int fy=0; fy<FY; fy++){
                for (int fx=0; fx<FX; fx++){
                  if ((oy+fy < IY) && (ox+fx < IX)) {
                    //std::cout << "output[[" << b << "][" << k << "][" << oy << "]["  << ox << "]] += ";
                    //std::cout << "weight[[" << k << "][" << c << "][" << fy << "]["  << fx << "]] * ";
                    //std::cout << "input[[" << b << "][" << c << "][" << oy+fy << "]["  << ox+fx << "]]" << std::endl << std::endl;
                    *(*(*(*(output+b)+k)+oy)+ox) += *(*(*(*(weight+k)+c)+fy)+fx) * *(*(*(*(input+b)+c)+(oy+fy))+(ox+fx));
                    //printf("O: %d, W: %d, I: %d\n", *(*(*(*(output+b)+k)+oy)+ox), *(*(*(*(weight+k)+c)+fy)+fx), *(*(*(*(input+b)+c)+(oy+fy))+(ox+fx)));
                    //printf("OUTPUT @ (%d, %d, %d, %d) = %d\n", b, k, oy, ox, output[b][k][oy][ox]);
                  } else {printf("SW IMPLEMENTATION OUTSIDE OF INPUT IMAGE\n");}
                }
              }
            }
          }
        }
      //printf("\n");
      }
    }
  }
private:
};
#endif

