%% Import data from text file.
% Script for importing data from the following text file:
%
%    C:\Users\Administrator\Documents\MATLAB\Hedge Fund Project\forex.csv
%% Initialize variables.
filename = 'C:\Users\Jonathan\Documents\MATLAB\Msc_WealthManagement\Hedge Fund Project\forex.csv';
delimiter = ';';
startRow = 2;

%% Format for each line of text:
formatSpec = '%f%f%f%[^\n\r]';

%% Open the text file.
fileID = fopen(filename,'r');

%% Read columns of data according to the format.
dataArray = textscan(fileID, formatSpec, 'Delimiter', delimiter, 'EmptyValue' ,NaN,'HeaderLines' ,startRow-1, 'ReturnOnError', false, 'EndOfLine', '\r\n');

%% Close the text file.
fclose(fileID);
%% Create output variable
forex = [dataArray{1:end-1}];
%% Clear temporary variables
clearvars filename delimiter startRow formatSpec fileID dataArray ans;