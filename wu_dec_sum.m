% This is Junxin Chen's implementation of Wu's medical image cipher (decryption part) which
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

% Besides, Wu's sum_up is assumed to be avaliable, without which the first
% pixel cannot be decrypted correctly.

function decipher=wu_dec_sum(cipher,sum_p)

[M,N]=size(cipher);
pixel_leng=M*N;
%% ---------------  
% 混沌迭代部分
a1=1.01;
b1=1.02;
x1_status=0.81;
y1_status=0.82;
a1=1.31;
b1=1.32;

%第二组参数
a2=1.13;
b2=1.14;
x2_status=0.83;
y2_status=0.84;

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

%% 解密测试
%迭代部分一样,即数组r, rx, ry, rz是一致的
ttc0=cipher;
ttc1(1:pixel_leng)=ttc0(x1_index);
decipher2=zeros(1,pixel_leng);
for i=pixel_leng:-1:1 %对除了首个像素之外的其他像素进行加密
    if i==1
        ttc_previous=sum_p;
    else
        ttc_previous=ttc1(1,i-1);
    end
    ttc2=bitxor(ttc_previous,ttc1(1,i));
%     ttc2=ttc1(i);
    [ttc_34,ttc_33,ttc_32,ttc_31]=DNA_enc_pixel(ttc2,rx(1,i));
    [tr4,tr3,tr2,tr1]=DNA_enc_pixel(r(1,i),rz(1,i));  %Diffusion--Step 4
    ttc_44=DNA_XOR(tr4,ttc_34);
    ttc_43=DNA_XOR(tr3,ttc_33);
    ttc_42=DNA_XOR(tr2,ttc_32);
    ttc_41=DNA_XOR(tr1,ttc_31); 
    ttc_5 =DNA_dec_pixel(ttc_44,ttc_43,ttc_42,ttc_41,ry(1,i));
    decipher2(1,i)=ttc_5;
end

decipher=uint8(decipher2);


