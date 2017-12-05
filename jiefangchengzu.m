clc;
alpha = exp( 1i * pi * 2/3);

syms z zn ua ub uc

format   
A =[
    4*z  -2*z 0 ua-ub;
    -2*z 4*z -z ub-uc;
    0 -z z+zn uc];
%% ��Ϊ��������
R = rref(A);
disp(R)

%% ��������ȣ���ʾ��ֵ��
z = 30+ 1i * 30;
zn = 10+ 1i * 20;
ua = 220;
ub = 220*alpha^2;
uc = 220*alpha;
R = subs(R)
R = eval(R);



%% ��ʾ

if  (rank(R) == min(size(A))) &&  (~isa(R,'sym'))
    x = R(:,end );
    disp(' ====== ���������ʽ =======')
    fprintf('X%d = %6.3f �� %6.3f��\n', [1:length(x);abs(x)'; (angle(x)*180/pi)']) %ÿ�����һ��
end












