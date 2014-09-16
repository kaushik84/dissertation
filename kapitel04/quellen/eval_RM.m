info = randint(1,14);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Reed-Muller Code (Shortened RM (30,14))
%bis jetzt kann nur ein Fehler korrigiert werden...
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Parameter
%
%Frame-length
fl=14;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Generator Matrix
G1=[1 0 0 1 1 0 1 1 0 1 1 0 0 0 0 0
    0 0 1 0 1 1 0 1 1 1 1 0 0 0 0 0
    1 1 1 1 1 1 0 0 0 0 1 0 0 0 0 0
    1 1 1 0 0 0 0 0 0 0 1 1 1 1 0 0
    1 0 0 1 1 0 0 0 0 0 1 1 1 0 1 0
    0 1 0 1 0 1 0 0 0 0 1 1 0 1 1 0
    0 0 1 0 1 1 0 0 0 0 1 0 1 1 1 0
    1 1 1 1 1 1 1 1 1 1 0 1 1 1 1 1
    1 0 0 0 0 0 1 1 0 0 1 1 1 0 0 1
    0 1 0 0 0 0 1 0 1 0 1 1 0 1 0 1
    0 0 1 0 0 0 0 1 1 0 1 0 1 1 0 1
    0 0 0 1 0 0 1 0 0 1 1 1 0 0 1 1
    0 0 0 0 1 0 0 1 0 1 1 0 1 0 1 1
    0 0 0 0 0 1 0 0 1 1 1 0 0 1 1 1];

G=[eye(14) G1];

%Ausgangsvektor
code=(mod(info*G,2));


%Parity Check Matrix
H=[G1' eye(16)];

% Kanal
error = eye(30);
rx = code+error(19,:);

%Syndrom
%s=mod((rx'*H'),2);
s = (mod(H*rx',2))';
%Fehlervektor wird ermittelt
e1=[s' s' s' s' s' s' s' s' s' s' s' s' s' s' s' s' s' s' s' s' s' s' s' s' s' s' s' s' s' s'];

e=mod((any(xor(H,e1)))+1,2);

%Korrektes Codewort
c_rx=rx-e;

%Korrektes Datenwort
info_rx=c_rx(1,1:14);

%Fehler
fehler = sum(abs(info_rx-info))