%CHARACTER TEST
load cr_net

e_test = imread('e_10.jpg')
imshow(e_test)
e_test = 255 - rgb2gray(e_test)
e_test = e_test > 128
e_test = bwmorph(e_test, 'remove')
e_test = 255 - e_test
e_test = reshape(e_test,[100,1])
y = sim(cr_net, e_test)
