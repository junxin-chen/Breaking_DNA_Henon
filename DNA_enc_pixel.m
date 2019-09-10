% encoding a pixel to 4 DNA bases

function [x4,x3,x2,x1]=DNA_enc_pixel(pixel,rule)
x4_index=bitand(pixel,192)/64;
x4=DNA_enc_withrule(x4_index,rule);
x3_index=bitand(pixel,48)/16;
x3=DNA_enc_withrule(x3_index,rule);
x2_index=bitand(pixel,12)/4;
x2=DNA_enc_withrule(x2_index,rule);
x1_index=bitand(pixel,3);
x1=DNA_enc_withrule(x1_index,rule);
end
