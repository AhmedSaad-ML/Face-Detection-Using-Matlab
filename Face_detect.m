
% basic matrices for filter and for images to be populated later  

a = ones(150,50);
b = zeros(150,50);
c = ones(150,50);
vary =zeros(150,150,500);
varyN =zeros(150,150,500);
M = horzcat(a,b,c) ; 
tsum=ones(500,1);
tNsum=zeros(500,1);
NF1=zeros(75,75);
NF2=ones(75,75);
CNF1=horzcat(NF2,NF1);
CNF2=horzcat(NF1,NF2);

NF3=ones(150,75);
NF4=zeros(150,75);

% U = horzcat(NF3,NF4);   %Filter "A"
% U = [a b c] ;           %Filter "C"
 U=[CNF1;CNF2];           %Filter "D"



%----------------------------------------------------------------------------------


%to change training faces images from rgb to gray scale and save them to project folder
% and mulitply them by filters and sum the elements then save them to array


X = '/Users/ahmedsaad/Desktop/Project/facedetection/training/faces';
allimages = dir(fullfile(X,'image*.jpg'));
 for k = 1:numel(allimages)
  filename   = allimages(k).name;
  rgbImg     = imread(filename);
  
  [rows, columns, numberofColorChannels] = size(rgbImg);
  if numberofColorChannels > 1
      gsImg      = rgb2gray(rgbImg);
      
      else
        gsImg      = rgbImg;
       
  end
  
 
  [~,name,~] = fileparts(filename);
  gsFilename = sprintf('%s_gs.jpg', name);
  imwrite(gsImg,gsFilename);
 end



 v = zeros(150,150) ;
 
D = '/Users/ahmedsaad/Desktop/Project';
S = dir(fullfile(D,'image*_gs.jpg')); % pattern to match filenames.
for k = 1:numel(S)
    F = fullfile(D,S(k).name);
    
    I = imread(F);
    %disp(I);
    
    %     imshow(I)
    
%         S(k).data = I; % optional, save data.
       
        
        for i = 1:length(I)
            for j = 1:length(I)
            %disp (k);
            v(i,j) = I(i,j).*U(i,j) ; 
            %varyCat(:,:,k)=v;
            end
            
        end 
        %varyCat(:,:,k)=v;
        P = sum(v);
        R = sum(P);
        tsum(k,1)=R;
    vary(:,:,k)= v;
    %varyCat=cat(500,varyCat(:,:,k),v);
     %disp (varyCat);
     %disp(vary(:,:,k));
     
end


% OOO = horzcat(tsum,str2double(your_mat));

% disp(vary(:,:,5));


%for 1:500


      

%     P = sum(v);
%     R = sum(P);


%--------------------------------------------------------------------------


%to change training nonfaces images from rgb to gray scale and save them to project folder
% and mulitply them by filters and sum the elements then save them to array


L = '/Users/ahmedsaad/Desktop/Project/facedetection/training/nonfaces';
allimages = dir(fullfile(L,'imagen*.jpg'));
 for kN = 1:numel(allimages)
  filename   = allimages(kN).name;
  rgbImg     = imread(filename);
  
  [rows, columns, numberofColorChannels] = size(rgbImg);
  if numberofColorChannels > 1
      gsImgN      = rgb2gray(rgbImg);
      
      else
        gsImgN      = rgbImg;
       
  end
  
 
  [~,name,~] = fileparts(filename);
  gsFilename = sprintf('%sn.jpg', name);
  imwrite(gsImgN,gsFilename);
 end



 q = zeros(150,150) ;
 
D = '/Users/ahmedsaad/Desktop/Project';
S = dir(fullfile(D,'imagen*n.jpg')); % pattern to match filenames.
for k = 1:numel(S)
    F = fullfile(D,S(k).name);
    
    I = imread(F);
    %disp(I);
    
     %   imshow(I)
    
%         S(k).data = I; % optional, save data.
       
        
        for i = 1:length(I)
            for j = 1:length(I)
            %disp (k);
            q(i,j) = I(i,j).*U(i,j) ; 
            %varyCat(:,:,k)=v;
            end
            
        end 
        %varyCat(:,:,k)=v;
        PN = sum(q);
        RN = sum(PN);
        tNsum(k,1)=RN;
    varyN(:,:,k)= q;
    %varyCat=cat(500,varyCat(:,:,k),v);
     %disp (varyCat);
     %disp(vary(:,:,k));
     
end

% disp(varyN(:,:,5));
%totsum=sum(tsum);
%totNsum=sum(tNsum);

% to plot the sum values of face and non-face matrices after the filter was applied
hold on         
plot(tsum);
plot(tNsum);
hold off





%--------------------------------------------------------------------------------------



%to change testing faces images from rgb to gray scale and save them to project folder
% and mulitply them by filters and sum the elements then save them to array


Z = '/Users/ahmedsaad/Desktop/Project/facedetection/testing/faces';
allimages = dir(fullfile(Z,'imagetp*.jpg'));
 for ktp = 1:numel(allimages)
  filename   = allimages(ktp).name;
  rgbImg     = imread(filename);
  
  [rows, columns, numberofColorChannels] = size(rgbImg);
  if numberofColorChannels > 1
      gsImgN      = rgb2gray(rgbImg);
      
      else
        gsImgN      = rgbImg;
       
  end
  
 
  [~,name,~] = fileparts(filename);
  gsFilename = sprintf('%sg.jpg', name);
  imwrite(gsImgN,gsFilename);
 end



 J = zeros(150,150) ;
 
D = '/Users/ahmedsaad/Desktop/Project';
S = dir(fullfile(D,'imagetp*g.jpg')); % pattern to match filenames.
for k = 1:numel(S)
    F = fullfile(D,S(k).name);
    
    I = imread(F);
    %disp(I);
    
     %   imshow(I)
    
%         S(k).data = I; % optional, save data.
       
        
        for i = 1:length(I)
            for j = 1:length(I)
            %disp (k);
            J(i,j) = I(i,j).*U(i,j) ; 
            %varyCat(:,:,k)=v;
            end
            
        end 
        %varyCat(:,:,k)=v;
        PN = sum(J);
        RN = sum(PN);
        ttpsum(k,1)=RN;
    varytp(:,:,k)= J;
    %varyCat=cat(500,varyCat(:,:,k),v);
     %disp (varyCat);
     %disp(vary(:,:,k));
     
end



%  disp(varytp(:,:,6));
 
 
 
 
 
 %-------------------------------------------------------------------------------------
 
 
%to change testing nonfaces images from rgb to gray scale and save them to project folder
% and mulitply them by filters and sum the elements then save them to array

 
H = '/Users/ahmedsaad/Desktop/Project/facedetection/testing/nonfaces';
allimages = dir(fullfile(H,'imagetN*.jpg'));
 for ktN = 1:numel(allimages)
  filename   = allimages(ktN).name;
  rgbImg     = imread(filename);
  
  [rows, columns, numberofColorChannels] = size(rgbImg);
  if numberofColorChannels > 1
      gsImgN      = rgb2gray(rgbImg);
      
      else
        gsImgN      = rgbImg;
       
  end
  
 
  [~,name,~] = fileparts(filename);
  gsFilename = sprintf('%sg.jpg', name);
  imwrite(gsImgN,gsFilename);
 end



 O = zeros(150,150) ;
 
D = '/Users/ahmedsaad/Desktop/Project';
S = dir(fullfile(D,'imagetN*g.jpg')); % pattern to match filenames.
for k = 1:numel(S)
    F = fullfile(D,S(k).name);
    
    I = imread(F);
    %disp(I);
    
     %   imshow(I)
    
%         S(k).data = I; % optional, save data.
       
        
        for i = 1:length(I)
            for j = 1:length(I)
            %disp (k);
            O(i,j) = I(i,j).*U(i,j) ; 
            %varyCat(:,:,k)=v;
            end
            
        end 
        %varyCat(:,:,k)=v;
        PN = sum(O);
        RN = sum(PN);
        ttNsum(k,1)=RN;
    varytN(:,:,k)= O;
    %varyCat=cat(500,varyCat(:,:,k),v);
     %disp (varyCat);
     %disp(vary(:,:,k));
     
end


% disp(varytN(:,:,6));


totalsum = [tsum;tNsum];
totalTsum = [ttpsum;ttNsum];



%-------------------------------------------------------------------------------------
%classification using fitch and classify using KNN and claculate confusionM


tpNN = ones(100,1);
tnNN = zeros(100,1);
grouphat = [tpNN;tnNN];
oNN = ones(500,1);
zNN = zeros(500,1);
group= [oNN;zNN];


KNN= fitcknn(totalsum,group,'NumNeighbors',5,'Standardize',1);
% Class= knnclassify(totalTsum,totalsum,group);
Label = predict(KNN,totalTsum);


 confMatrix = confusionmat(Label,grouphat);
 
%  confMatrixinverse = confMatrix';
%   plotconfusion([53;47],[28;72]);



%-------------------------------------------------------------------------------------
