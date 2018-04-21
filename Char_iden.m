clear all
clc
clear cr_net

%CHARACTER IDENTIFICATION
e1 = imread('e_6.jpg')
imshow(e1)
e2 = imread('e_7.jpg')
imshow(e2)
e3 = imread('e_8.jpg')
imshow(e3)
e4 = imread('e_9.jpg')
imshow(e4)
f1 = imread('f_3.jpg')
imshow(f1)
f2 = imread('f_4.jpg')
imshow(f2)
f3 = imread('f_5.jpg')
imshow(f3)
f4 = imread('f_6.jpg')
imshow(f4)


%CONVERT TO GRAYSCALE
e1 = 255 - rgb2gray(e1)
e2 = 255 - rgb2gray(e2)
e3 = 255 - rgb2gray(e3)
e4 = 255 - rgb2gray(e4)
f1 = 255 - rgb2gray(f1)
f2 = 255 - rgb2gray(f2)
f3 = 255 - rgb2gray(f3)
f4 = 255 - rgb2gray(f4)

%CONVERT TO BINARY
e1 = e1 > 128
e2 = e2 > 128
e3 = e3 > 128
e4 = e4 > 128
f1 = f1 > 128
f2 = f2 > 128
f3 = f3 > 128
f4 = f4 > 128

e1 = bwmorph(e1, 'remove')
e2 = bwmorph(e2, 'remove')
e3 = bwmorph(e3, 'remove')
e4 = bwmorph(e4, 'remove')
f1 = bwmorph(f1, 'remove')
f2 = bwmorph(f2, 'remove')
f3 = bwmorph(f3, 'remove')
f4 = bwmorph(f4, 'remove')

e1 = 255 - e1
e2 = 255 - e2
e3 = 255 - e3
e4 = 255 - e4
f1 = 255 - f1
f2 = 255 - f2
f3 = 255 - f3
f4 = 255 - f4

%CONVERT TO VECTOR
e1 = reshape(e1,[100,1])
e2 = reshape(e2,[100,1])
e3 = reshape(e3,[100,1])
e4 = reshape(e4,[100,1])
f1 = reshape(f1,[100,1])
f2 = reshape(f2,[100,1])
f3 = reshape(f3,[100,1])
f4 = reshape(f4,[100,1])

%CONVERT INTO MATRIX
s = horzcat(e1,f1,e2,f2,e3,f3,e4,f4)

%CREATE TARGET
t = [0, 1, 0, 1, 0, 1, 0, 1; 1, 0, 1, 0, 1, 0, 1, 0; ]

cr_net = newff(s,t,1)

[cr_net, cr_tr] = traingd(cr_net,s,t)

y = sim(cr_net, s)

save cr_net
