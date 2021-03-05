clc, clear all, close all

%% Bit �evirme 
X = imread('image.jpg'); % imread komutu ile dizindeki image adl� g�rsel al�nd� ve X de�i�kenine atand�.
image = X./16;           % X e�i�kenindeki g�rsel 4 bitlik g�r�nt�ye �evirildi.
image2 = X./8;           % X e�i�kenindeki g�rsel 3 bitlik g�r�nt�ye �evirildi.

subplot(1,3,1);          
% tek tek pencere a�mak yerine ayn� pencere �zerinde birden fazla g�rsel... 
% g�r�nt�leyebilmek i�in subplot komutu kullan�ld�.
imshow(X);
title('Orijinal g�rsel:')
 
subplot(1,3,2);
imshow(image,[]);
title('4 bitlik g�rsel:')
 
subplot(1,3,3);
imshow(image2,[]);
title('3 bitlik g�rsel:')
 

%% Colormap 1
I = imread('image.jpg');        % imread komutu ile dizindeki image adl� g�rsel al�nd� ve I de�i�kenine atand�.
[indexed,map] = rgb2ind(I,255); 
% I de�i�kenindeki g�rsel rgb2ind komutu ile indeksli hale d�n��t�r�ld� ve map komutu ile renk haritas�(10 renk) al�nd�.  
I2 = ind2rgb(indexed,map);      
% indeksli g�rsel ind2rgb komutu ile renkli g�r�nt�ye �evrilerek map'in i�erisindeki renklerle renklendirildi ve I2 de�i�kenine atand�.

subplot(1,2,1); % tek tek pencere a�mak yerine ayn� pencere �zerinde birden fazla g�rsel g�r�nt�leyebilmek i�in subplot komutu kullan�ld�.
imshow(I);      % orjinal g�rsel ekrana bas�ld�.
title('Orijinal g�rsel:');

subplot(1,2,2);
imshow(I2);     % tekrar renklendirilen g�rsel ekrana bas�ld�.
title('Tekrar renklendirilmi� g�rsel:');

%% Colormap 2
A = imread('image4.jpg'); % imread komutu ile dizindeki image4 adl� g�rsel al�nd� ve A de�i�kenine atand�.

subplot(1,2,1);  % tek tek pencere a�mak yerine ayn� pencere �zerinde birden fazla g�rsel g�r�nt�leyebilmek i�in subplot komutu kullan�ld�.
imshow(A);       % orjinal g�rsel ekrana bas�ld�.
title('Orijinal g�rsel');

A = rgb2gray(A); % true color g�r�nt� rgb2gray komutu ile gray g�r�nt�ye d�n��t�r�ld�.

subplot(1,2,2);
imshow(A);       % gri g�r�nt� ekrana bas�ld�.
title('Gri g�r�nt�n�n lines renk haritas� ile renklendirilmi� g�rsel');

colormap(lines); % a��lan yeni pencerede gri g�r�nt� lines renk haritas�yla renklendirildi.
colorbar;

%% G�rselin Negatifini Alma
B = imread('image7.png');   % imread komutu ile dizindeki image7 adl� g�rsel al�nd� ve B de�i�kenine atand�.
B = rgb2gray(B);            % true color g�r�nt� rgb2gray komutu ile gray g�r�nt�ye d�n��t�r�ld� ve B de�i�kenine atand�.
F = B>100;                  % 100'den b�y�k de�erler 1, 100'den k���k de�erler 0 yap�ld�. Bu i�lemle g�r�nt�n�n negatifi al�nm�� oldu.

subplot(1,2,1);       % tek tek pencere a�mak yerine ayn� pencere �zerinde birden fazla g�rsel  g�r�nt�leyebilmek i�in subplot komutu kullan�ld�.
imshow(B);            % gri g�rsel ekrana bas�ld�.
title('Gri g�rsel');

subplot(1,2,2);
imshow(F);            % negatifi al�nan g�rsel krana bas�ld�.
title('Negatifi al�nan g�rsel');
%% Log Transformation

K = imread('image8.gif'); % imread komutu ile dizindeki image8 adl� g�rsel al�nd� ve K de�i�kenine atand�.

subplot(1,2,1);          
% tek tek pencere a�mak yerine ayn� pencere �zerinde birden fazla g�rsel g�r�nt�leyebilmek i�in subplot komutu kullan�ld�.
imshow(K);                % orjinal g�rsel ekrana bas�ld�.
title('Orjinal g�rsel');

K = K+1;          
% logaritma 0 de�erini almas�n diye her piksel de�erine 1 eklendi. 0 olan de�erler 1 olmu� olup log(1) 0 de�erine kar��l�k gelir.
K = im2double(K); % matematiksel i�lemler i�in double veri t�r� uygundur. im2double komutu ile uint8'den double'a �evirildi.
K = log(K);       % her de�erin logaritmas� al�nd�.
K = mat2gray(K);  % matris 0 (siyah) ila 1 (beyaz) aral���nda de�erler i�eren grayscale bir g�r�nt�ye d�n��t�r�ld�.

subplot(1,2,2);
imshow(K);        % Logaritmas� al�nan g�r�nt� ekrana yans�t�ld�.
title('Logaritmas� al�nan g�rsel');

%% Power Lav (gamma) Transformation
image = imread('imgg.jpg');          % imread komutu ile dizindeki imgg.jpg adl� g�rsel al�nd� ve K de�i�kenine atand�.
image = im2double(image);            % matematiksel i�lemler i�in double veri t�r� uygundur. im2double komutu ile uint8'den double'a �evirildi.
lim = stretchlim(image,[0.01,0.99]); 
% image de�i�kenine atanan g�rsel i�in stretchlim komutu ile limitler bulundu. kontrast germe i�lemi i�in t�m range aral��� kullan�laca�� belirtildi.
j = imadjust(image,lim,[]);          % imadjust komutu ile kontrast germe i�lemi uyguland�.
k = imadjust(image,[0.06,0.55],[]);  % germek istenilen aral���n de�erlerini el ile girilip kontrast germe i�leminin uygulanmas�.

subplot(2,3,1);              
% tek tek pencere a�mak yerine ayn� pencere �zerinde birden fazla g�rsel ve histogram� g�r�nt�leyebilmek i�in subplot komutu kullan�ld�.
imshow(image,[]);            % g�r�nt� ekrana yans�t�ld�.
title('1. Orjinal g�rsel:'); % G�rsele ait ba�l�k yaz�ld�.

subplot(2,3,2); 
imshow(j);      % g�r�nt� ekrana yans�t�ld�.
title('2. Konstrat� gerilmi� g�rsel(stretchlim):');

subplot(2,3,3);
imshow(k);      % g�r�nt� ekrana yans�t�ld�.
title('3. Konstrat� gerilmi� g�rsel:');

subplot(2,3,4);
imhist(image);  % g�r�nt�n�n yo�unluk da��l�mlar�n� g�rmek i�in, imhist fonksiyonu �a�r�larak bir histogram olu�turuldu.
title('1. Orjinal g�rselin histogram�:');

subplot(2,3,5);
imhist(j);      % g�r�nt� ekrana yans�t�ld�.
title('2. Konstrat� gerilmi� g�rselin histogram�(stretchlim):');

subplot(2,3,6);
imhist(k);      % g�r�nt� ekrana yans�t�ld�.
title('3. Konstrat� gerilmi� g�rselin histogram�:');

%% BitPlane 
image = imread('image.jpg');  % dizindeki image.pjg gri g�rseli imread komutu ile al�nd�.
image = rgb2gray(image);
for i = 1:8
    bitPlane{i} = bitget(image,i);
    figure(1), subplot(2,4,i), imshow(logical(bitPlane{1,i}));
    % bitget komutu ile g�rselin piksel de�erlerinin ikili koddaki kar��l���n�n 8 biti ayr� ayr� al�nd� ve subplot ile akrana bas�ld�. 
end
%%
image2 = zeros(size(image));
for j = 1:8
    image2 = bitset(image2,j,bitPlane{1,j});
end
figure(2), imshow(uint8(image2)); 
% bit plane'lerine ayr�lan g�rsel bitset komutu ile birle�tirildi ve ekrana bas�ld�.

%% bitset komutu kullan�lmadan bitPlane'lerin birle�tirilmesi.
[m,n] = size(image);  % G�rselin boyutu al�nd�.
for i = 1: m
    for j = 1: n       % birle�tirme i�in t�m pikseller gezildi.
        img(i,j)= 0;
        sayac = 8;
        for k = 1:8   % bitPlane bit de�erleri gezildi.
                      % bitPlane bit de�erleri piksel de�erlerinin bulunmas� i�in decimal de�erlere �evrildi ve img de�i�kenine atand�. 
            img(i,j)= img(i,j) + (double(bitPlane{1,k}(i,j)))*2^(8-sayac);
            sayac = sayac - 1;
        end
    end
end
figure(3), imshow(uint8(img)); % Birle�tirilen g�rsel ekrana bas�ld�.