%%简单的主程序，主要用于测试各类主加密解密程序的有效性
clear
clc
close all

% p=imread('lenna256.bmp');
% [M,N]=size(p);
% [c,sum_p]=wu_enc_sum(reshape(p,1,M*N));
% d=wu_dec_sum(reshape(c,1,M*N),sum_p);
% dd=double(reshape(p,1,M*N))-double(d);

p1=uint8(zeros(1,9));
[M,N]=size(p1);
[c1,sum_p1]=wu_enc_sum(p1);
d1=wu_dec_sum(c1,sum_p1);


p2=uint8(zeros(1,9));
p2(1,1)=1;
[c2,sum_p2]=wu_enc_sum(p2);
d2=wu_dec_sum(c2,sum_p2);


p3=uint8(zeros(1,9));
p3(1,2)=1;
[c3,sum_p3]=wu_enc_sum(p3);
d3=wu_dec_sum(c3,sum_p32);