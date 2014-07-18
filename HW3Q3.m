% Robert Ackerman


% Homework 3
% Problem 2 Questions (g) and (h)
% November 5, 2013

% Ghysels, Hill, and Motegi (2013), "Regression-based Mixed Frequency
% Granger Causality Tests," Working Paper. University of North Carolina at
% Chapel Hill


%% Step 1: Preliminary settings
alpha = 0.05;
phi = 0.8;

% grids for c1 and c2,
c1vec = (-3.0:0.05:3.0)';
c2vec = (-3.0:0.05:3.0)';

%% Step 2: Grid search
nc1 = size(c1vec,1);            % # of alpha's tried in 1st stage
nc2 = size(c2vec,1);            % # of beta's tried in 1st stage

% Power
P = zeros(nc1, nc2);
for i = 1:nc1      % loop wrt. c1, 
     c1 = c1vec(i);
     for j = 1:nc2  % loop wrt. bc2,
          c2 = c2vec(j);  
          kappa=(c1+phi*c2)^2/(1-phi^2);
          P(i,j) = 1-ncx2cdf(3.841,1,kappa); %Calculate Power  
     end;
end;



%% Step 3: 3-D Plot

% Plot Power for each pair (c1, c2)
c1mat = kron(c1vec, ones(1,nc1));   % linescale for c1
c2mat = kron(c2vec', ones(nc2,1));  % linescale for c2
figure(1)  % plot 3D figure
surf(c1mat, c2mat, P, 'EdgeColor','none', 'FaceColor','interp', 'FaceLighting','phong');
xlabel('c1','FontSize',11); ylabel('c2','FontSize',11); 
zlabel('Power','FontSize',11); 
set(gca, 'FontSize', 11);

%% Step 4: Contour Plot

%Draw Contour Plot

figure(2)  % plot contour of all J statistics
contour(c1mat, c2mat, P, 'ShowText', 'on');
xlabel('c1','FontSize',11); ylabel('c2','FontSize',11); 