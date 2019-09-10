%decoding four DNA bases into a gray-scale pixel

function pixel=DNA_dec_pixel(y4,y3,y2,y1,rule)

index_4=DNA_dec_withrule(y4,rule);
index_3=DNA_dec_withrule(y3,rule);
index_2=DNA_dec_withrule(y2,rule);
index_1=DNA_dec_withrule(y1,rule);

pixel=index_4*64+index_3*16+index_2*4+index_1;
pixel=uint8(pixel);
end
