% This is the source code for a chosen-plain attack which is given in
% 'Cryptanalysis of an encryption scheme using Henon-Sine map and DNA random
% coding' (Information Sciences, vol **, no **, pp **-**, 2019).

% The original encryption scheme (the cipher to be cracked) is published in: 
% Wu, J., Liao, X., & Yang, B. (2018). Image encryption using 2D Henon-Sine map 
% and DNA approach. Signal Processing, 153, 11-23.

% All copyrights are reserved by Junxin Chen. E-mail:chenjx@bmie.neu.edu.cn
% All of the source codes are free to distribute, to use, and to modify
%    for research and study purposes, but absolutely NOT for commercial uses.
% If you use any of the following code in your academic publication(s), 
%    please cite the corresponding paper, as aforementioned. 
% If you have any questions, please email me and I will try to response you ASAP.
% It worthwhile to note that all following source codes are written under MATLAB R2018a.

clear
clc
close all

p=imread('pp33.bmp');

% p=imread('lenna256.bmp');
[M,N]=size(p);
p_leng=M*N;
% encrypt the plaintext
[c,sum_p]=wu_enc_sum(reshape(p,1,M*N));

%% recover the permutation matrix
p0=zeros(1,p_leng);
sum0=sum(p0);
[c0,sum_p0]=wu_enc_sum(p0);
c0_2=bitxor(sum0,c0);

index=zeros(1,p_leng);
diff_pos_previous=zeros(1,1);
for i=p_leng:-1:1
% for i=99:99
%     i
    pp=zeros(1,p_leng);
    pp(1,i)=1;
    pp=uint8(pp);
    [cc,sum_pp]=wu_enc_sum(pp);
    cc_2=bitxor(sum_pp,cc);
    cd=double(c0_2)-double(cc_2);
    diff_pos=find(cd);
    index(1,i)=setdiff(diff_pos,diff_pos_previous);
    diff_pos_previous=diff_pos;
end
% % save permu_256_for_paper index

%% recover the substitution matrix
s_box=zeros(256,M*N);

for i=0:255
    pp=zeros(1,p_leng);
    pp=pp+i
    [cc,sum_pp]=wu_enc_sum(pp)
    cc2=zeros(1,p_leng);
    cc2(1:p_leng)=cc(index);% offset the permutation matrix
    for j=p_leng:-1:2
        cc3(1,j)=bitxor(cc2(1,j),cc2(1,j-1)) %t
    end
    cc3(1,1)=bitxor(cc2(1,1),sum_pp)%recover the first pixel
    s_box(i+1,:)=cc3(1,:);
end
s_box=uint8(s_box); 

% % save s_box_256_for_paper s_box
% 
% %% recover the plaintext using the obtained permutation vector and substitution boxes
% 
% ttc0=c;
% ttc1(1:p_leng)=ttc0(index);
% decipher2=zeros(1,p_leng);
% for i=p_leng:-1:1 %进行解密, sum_p已知
% %     i
%     if i==1
%     ttc2=bitxor(sum_p,ttc1(1,i));
%     else
%     ttc2=bitxor(ttc1(1,i-1),ttc1(1,i));
%     end
%     current_box=s_box(:,i);
%     decipher2(1,i)=find(current_box==ttc2)-1;%索引比实际映射关系大1
% end
% decipher=uint8(decipher2);
% decipher=reshape(decipher,M,N);
% % check the difference
% dd=double(decipher)-double(p);
% 
