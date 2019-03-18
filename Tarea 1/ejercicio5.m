%-------------------------
% Ejercicio 5
%-------------------------

% Se grafica la funcion s(n) como muestreo y s(t) como funcion continua superpuestas  
% Integrantes: Alejandra Castrillo - Justin Chavarria - Cristhian Rojas

function ejercicio5(A,Fo,Fs,C,ti,tf)
    
    stFunc           = @(A,Fo,Fs,C,t) A*sin((2*pi*Fo*t)+C);     % Funci�n de forma continua
    snFunc           = @(A,Fo,Fs,C,n) A*sin((2*pi*Fo*n)/Fs+C);  % Funci�n en variable discreta
    samplesPerPeriod = Fs/Fo;                                   % Cantidad de muestras por periodo
    periods          = (tf-ti) * Fo;                            % Cantidad de periodos de ti a tf
    n                = 0:1:floor(periods*samplesPerPeriod);     % Array con las muestras
    sn               = snFunc(A,Fo,Fs,C,n);                     % Calculo de la se�al discreta
    t                = linspace(ti,tf,300);                     % Variable de tiempo
    st               = stFunc(A,Fo,Fs,C,t);                     % Calculo de la se�al continua
    
    figure('Name', 'Ejercicio 5');
    
    hold on; 
    stem(n, sn, 'filled', 'g');                                             % Grafica las muestras 
    plot(linspace(0,floor(periods*samplesPerPeriod),length(st)), st, 'r');  % Grafica la se�al continua 
    hold off;
    axis tight;
    title(" s(n) ");

end