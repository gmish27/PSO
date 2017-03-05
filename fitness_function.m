function [pbest] = fitness_function(p);

%pbest = p(1,1)^2 - p(1,2)^2 + p(1,1)*p(1,3) + p(1,1)*p(1,2);

pbest = sin(p(1,1))/p(1,1) + sin(p(1,2))/p(1,2)...
        + sin(p(1,3))/p(1,3);
end