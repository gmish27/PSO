for row=1:np
    for col=1:dim   
        plot3(p(row,col),row,col,'ro');
        title(['\fontsize{20}\color{black}Iteration #',int2str(j)]);
        hold on;
    end
    pause(10/iter)
end
hold off;