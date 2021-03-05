clc, clear all, close all

%% Bit Çevirme 
X = imread('image.jpg'); % imread komutu ile dizindeki image adlý görsel alýndý ve X deðiþkenine atandý.
image = X./16;           % X eðiþkenindeki görsel 4 bitlik görüntüye çevirildi.
image2 = X./8;           % X eðiþkenindeki görsel 3 bitlik görüntüye çevirildi.

subplot(1,3,1);          
% tek tek pencere açmak yerine ayný pencere üzerinde birden fazla görsel... 
% görüntüleyebilmek için subplot komutu kullanýldý.
imshow(X);
title('Orijinal görsel:')
 
subplot(1,3,2);
imshow(image,[]);
title('4 bitlik görsel:')
 
subplot(1,3,3);
imshow(image2,[]);
title('3 bitlik görsel:')
 

%% Colormap 1
I = imread('image.jpg');        % imread komutu ile dizindeki image adlý görsel alýndý ve I deðiþkenine atandý.
[indexed,map] = rgb2ind(I,255); 
% I deðiþkenindeki görsel rgb2ind komutu ile indeksli hale dönüþtürüldü ve map komutu ile renk haritasý(10 renk) alýndý.  
I2 = ind2rgb(indexed,map);      
% indeksli görsel ind2rgb komutu ile renkli görüntüye çevrilerek map'in içerisindeki renklerle renklendirildi ve I2 deðiþkenine atandý.

subplot(1,2,1); % tek tek pencere açmak yerine ayný pencere üzerinde birden fazla görsel görüntüleyebilmek için subplot komutu kullanýldý.
imshow(I);      % orjinal görsel ekrana basýldý.
title('Orijinal görsel:');

subplot(1,2,2);
imshow(I2);     % tekrar renklendirilen görsel ekrana basýldý.
title('Tekrar renklendirilmiþ görsel:');

%% Colormap 2
A = imread('image4.jpg'); % imread komutu ile dizindeki image4 adlý görsel alýndý ve A deðiþkenine atandý.

subplot(1,2,1);  % tek tek pencere açmak yerine ayný pencere üzerinde birden fazla görsel görüntüleyebilmek için subplot komutu kullanýldý.
imshow(A);       % orjinal görsel ekrana basýldý.
title('Orijinal görsel');

A = rgb2gray(A); % true color görüntü rgb2gray komutu ile gray görüntüye dönüþtürüldü.

subplot(1,2,2);
imshow(A);       % gri görüntü ekrana basýldý.
title('Gri görüntünün lines renk haritasý ile renklendirilmiþ görsel');

colormap(lines); % açýlan yeni pencerede gri görüntü lines renk haritasýyla renklendirildi.
colorbar;

%% Görselin Negatifini Alma
B = imread('image7.png');   % imread komutu ile dizindeki image7 adlý görsel alýndý ve B deðiþkenine atandý.
B = rgb2gray(B);            % true color görüntü rgb2gray komutu ile gray görüntüye dönüþtürüldü ve B deðiþkenine atandý.
F = B>100;                  % 100'den büyük deðerler 1, 100'den küçük deðerler 0 yapýldý. Bu iþlemle görüntünün negatifi alýnmýþ oldu.

subplot(1,2,1);       % tek tek pencere açmak yerine ayný pencere üzerinde birden fazla görsel  görüntüleyebilmek için subplot komutu kullanýldý.
imshow(B);            % gri görsel ekrana basýldý.
title('Gri görsel');

subplot(1,2,2);
imshow(F);            % negatifi alýnan görsel krana basýldý.
title('Negatifi alýnan görsel');
%% Log Transformation

K = imread('image8.gif'); % imread komutu ile dizindeki image8 adlý görsel alýndý ve K deðiþkenine atandý.

subplot(1,2,1);          
% tek tek pencere açmak yerine ayný pencere üzerinde birden fazla görsel görüntüleyebilmek için subplot komutu kullanýldý.
imshow(K);                % orjinal görsel ekrana basýldý.
title('Orjinal görsel');

K = K+1;          
% logaritma 0 deðerini almasýn diye her piksel deðerine 1 eklendi. 0 olan deðerler 1 olmuþ olup log(1) 0 deðerine karþýlýk gelir.
K = im2double(K); % matematiksel iþlemler için double veri türü uygundur. im2double komutu ile uint8'den double'a çevirildi.
K = log(K);       % her deðerin logaritmasý alýndý.
K = mat2gray(K);  % matris 0 (siyah) ila 1 (beyaz) aralýðýnda deðerler içeren grayscale bir görüntüye dönüþtürüldü.

subplot(1,2,2);
imshow(K);        % Logaritmasý alýnan görüntü ekrana yansýtýldý.
title('Logaritmasý alýnan görsel');

%% Power Lav (gamma) Transformation
image = imread('imgg.jpg');          % imread komutu ile dizindeki imgg.jpg adlý görsel alýndý ve K deðiþkenine atandý.
image = im2double(image);            % matematiksel iþlemler için double veri türü uygundur. im2double komutu ile uint8'den double'a çevirildi.
lim = stretchlim(image,[0.01,0.99]); 
% image deðiþkenine atanan görsel için stretchlim komutu ile limitler bulundu. kontrast germe iþlemi için tüm range aralýðý kullanýlacaðý belirtildi.
j = imadjust(image,lim,[]);          % imadjust komutu ile kontrast germe iþlemi uygulandý.
k = imadjust(image,[0.06,0.55],[]);  % germek istenilen aralýðýn deðerlerini el ile girilip kontrast germe iþleminin uygulanmasý.

subplot(2,3,1);              
% tek tek pencere açmak yerine ayný pencere üzerinde birden fazla görsel ve histogramý görüntüleyebilmek için subplot komutu kullanýldý.
imshow(image,[]);            % görüntü ekrana yansýtýldý.
title('1. Orjinal görsel:'); % Görsele ait baþlýk yazýldý.

subplot(2,3,2); 
imshow(j);      % görüntü ekrana yansýtýldý.
title('2. Konstratý gerilmiþ görsel(stretchlim):');

subplot(2,3,3);
imshow(k);      % görüntü ekrana yansýtýldý.
title('3. Konstratý gerilmiþ görsel:');

subplot(2,3,4);
imhist(image);  % görüntünün yoðunluk daðýlýmlarýný görmek için, imhist fonksiyonu çaðrýlarak bir histogram oluþturuldu.
title('1. Orjinal görselin histogramý:');

subplot(2,3,5);
imhist(j);      % görüntü ekrana yansýtýldý.
title('2. Konstratý gerilmiþ görselin histogramý(stretchlim):');

subplot(2,3,6);
imhist(k);      % görüntü ekrana yansýtýldý.
title('3. Konstratý gerilmiþ görselin histogramý:');

%% BitPlane 
image = imread('image.jpg');  % dizindeki image.pjg gri görseli imread komutu ile alýndý.
image = rgb2gray(image);
for i = 1:8
    bitPlane{i} = bitget(image,i);
    figure(1), subplot(2,4,i), imshow(logical(bitPlane{1,i}));
    % bitget komutu ile görselin piksel deðerlerinin ikili koddaki karþýlýðýnýn 8 biti ayrý ayrý alýndý ve subplot ile akrana basýldý. 
end
%%
image2 = zeros(size(image));
for j = 1:8
    image2 = bitset(image2,j,bitPlane{1,j});
end
figure(2), imshow(uint8(image2)); 
% bit plane'lerine ayrýlan görsel bitset komutu ile birleþtirildi ve ekrana basýldý.

%% bitset komutu kullanýlmadan bitPlane'lerin birleþtirilmesi.
[m,n] = size(image);  % Görselin boyutu alýndý.
for i = 1: m
    for j = 1: n       % birleþtirme için tüm pikseller gezildi.
        img(i,j)= 0;
        sayac = 8;
        for k = 1:8   % bitPlane bit deðerleri gezildi.
                      % bitPlane bit deðerleri piksel deðerlerinin bulunmasý için decimal deðerlere çevrildi ve img deðiþkenine atandý. 
            img(i,j)= img(i,j) + (double(bitPlane{1,k}(i,j)))*2^(8-sayac);
            sayac = sayac - 1;
        end
    end
end
figure(3), imshow(uint8(img)); % Birleþtirilen görsel ekrana basýldý.