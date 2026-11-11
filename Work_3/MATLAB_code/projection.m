function [pr_x, pr_y]=projection(z, xlimits, ylimits)

% functions that finds the projection of z vector on X. Space has 2 dimensions, R^2
% X constraints have limits [xlimits, ylimits], rectangular space. 
    
x=z(1); 
y=z(2);
% initialiaze projection values
pr_x=x; 
pr_y=y;
 
% dimension of x
if x>xlimits(2)
    pr_x=xlimits(2);
end

if x<=xlimits(1)
    pr_x=xlimits(1);
end

% dimension of y
if y>=ylimits(2)
    pr_y=ylimits(2);
end

if y<=ylimits(1)
    pr_y=ylimits(1);
end

end