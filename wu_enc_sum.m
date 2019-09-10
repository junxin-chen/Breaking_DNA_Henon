% This is Junxin Chen's implementation of Wu's medical image cipher (encryption part) which
% is published in: Wu, J., Liao, X., & Yang, B. (2018). Image encryption using 2D Henon-Sine map 
% and DNA approach. Signal Processing, 153, 11-23.

% All copyrights are reserved by Junxin Chen. E-mail:chenjx@bmie.neu.edu.cn

% All of the source codes are free to distribute, to use, and to modify
%    for research and study purposes, but absolutely NOT for commercial uses.
% If you use any of the following code in your academic publication(s), 
%    please cite the corresponding paper, as aforementioned. 
% If you have any questions, please email me and I will try to response you ASAP.
% It worthwhile to note that all following source codes are written under MATLAB R2018a.

% Interesting readers are also encouraged to refer to the original paper
% and to contact with the original authors for more details of this cipher

% In this implementation, the input is in vector format, without loss of
% generality. 

function [cipher,sum_p]=wu_enc_sum(plain)

[M,N]=size(plain);
pixel_leng=M*N;

% 密钥
a1=1.31;
b1=1.32;
x1_status=0.81;
y1_status=0.82;


%第二组参数
a2=1.13;
b2=1.14;
x2_status=0.83;
y2_status=0.84;



%% ---------------  
%混沌数组初始化
x1=zeros(1,pixel_leng);
rx=zeros(1,pixel_leng);
ry=zeros(1,pixel_leng);
rz=zeros(1,pixel_leng);
r=zeros(1,pixel_leng);

%混沌数组迭代
for i=1:pixel_leng
        [x1_status,y1_status]=he_sin_map(a1,b1,x1_status,y1_status);
        x1(1,i)=x1_status;
        [x2_status,y2_status]=he_sin_map(a2,b2,x2_status,y2_status);
        
        rx(1,i)=mod(round(x1_status*10^(10)),8)+1;
        ry(1,i)=mod(round(y1_status*10^(10)),8)+1;
        rz(1,i)=mod(round(x2_status*10^(10)),8)+1;
        r(1,i) =mod(round(y2_status*10^(10)),256);  
end
r=uint8(r);
[~,x1_index]=sort(x1);
% 混沌迭代结束  
%% 开始加密
tmp=uint8(mod(sum(double(plain)),256));
sum_p=tmp;
ti=zeros(1,pixel_leng);
di=zeros(1,pixel_leng);
for i=1:pixel_leng
        [tr4,tr3,tr2,tr1]=DNA_enc_pixel(r(1,i),rz(1,i));  %Diffusion--Step 4
        [tp4,tp3,tp2,tp1]=DNA_enc_pixel(plain(1,i),ry(1,i)); %Diffusion--Step 5
        trp1=DNA_XOR(tr1,tp1);%Diffusion--Step 6
        trp2=DNA_XOR(tr2,tp2);
        trp3=DNA_XOR(tr3,tp3);
        trp4=DNA_XOR(tr4,tp4);
        ti(1,i)=DNA_dec_pixel(trp4,trp3,trp2,trp1,rx(1,i));%Diffusion--Step 7
        di(1,i)=bitxor(ti(1,i),tmp);
        tmp= di(1,i);
end
%使用chaotic sort代替原文的permutation
cipher(1,x1_index)=di(1,1:pixel_leng);
cipher=uint8(cipher);
% 加密结束
% save x1_index_256_forpaper x1_index
% save cipher21_32_0 cipher21
end

