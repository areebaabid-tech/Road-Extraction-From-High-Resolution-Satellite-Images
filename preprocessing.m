clc
close all;
I=imread('C:\Users\areeba abid\Desktop\dataset\test_4.png');
%I=imread('?C:\Users\areeba abid\Downloads\planesnet\planesnet');
%[file,path] = uigetfile;
%I=imread(file);
figure;
imshow(I);
title('Original image');
J=rgb2gray(I);
%whos
figure,imshow(J);
title('grayscale image');
%[a,b]=size(J);
%K = zeros(a,b);
K=imadjust(J,[0.5 0.9],[]);
%P=find(J >= 127.5);
%S=find(J <= 229.5);
%M=intersect(P,S);
%K(M)= J(M);
figure;
imshow(K);

level = graythresh(K);  
%I=imbinarize(K,level);
B_W=im2bw(K,level);
figure;
imshow(B_W);
title('Binary image after thresholding');

B = medfilt2(B_W);
figure,imshow(B);
title('median filtered image');
