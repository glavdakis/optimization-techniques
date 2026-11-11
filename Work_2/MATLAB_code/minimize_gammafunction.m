function [minArg,minValue]=minimize_gammafunction(f, starting_point, gradf_value)

% bicection with derivative algorithm to minimize the function of gamma and return its min value and the argument that holds it
    
% parameters to be changed
upper=3;
lower=0;
l=0.6;

syms g(x);
g(x)=f(starting_point(1)+x*gradf_value(1),starting_point(2)+x*gradf_value(2));
dg=diff(g);

while upper-lower>=l
  midpoint=(upper+lower)/2;
  der_g=dg(midpoint);
  if der_g>0
     upper=midpoint;
  elseif der_g<0
     lower=midpoint;
  else
      % break the loop
      upper=midpoint;
      lower=midpoint;
  end
end

minArg=upper; % = lower
minValue=g(minArg);

end