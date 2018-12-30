function [goodstr] = getASCIIstr(s)
%jiamisuanfa
ra= fix(mean(double(s)));%jia mi suan zi
code = double(s);%qu zheng
encode = code*ra+ra;
goodstr = num2str(encode);



