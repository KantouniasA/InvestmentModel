function CarRentalBusiness = GenerateCarRentalBusiness

%% Current date
currentDate         = 2023;
age                 = 0;

%% Car identities
carIdentities = ["Car1";"Car2";"Car3"];

%% Money cash
cash                = 0;

%% Cars
% Car 1
Car1 = struct;
Car1.model          = "EUp";
Car1.type           = "eV";
Car1.age            = 0;
Car1.dateRelease    = 2023;
Car1.dateCurrent    = 2023;
Car1.id             = "Car1";

% Car 2
Car2 = struct;
Car2.model          = "EUp";
Car2.type           = "eV";
Car2.age            = 0;
Car2.dateRelease    = 2023;
Car2.dateCurrent    = 2023;
Car2.id             = "Car2";

% Car 3
Car3 = struct;
Car3.model          = "EUp";
Car3.type           = "eV";
Car3.age            = 0;
Car3.dateRelease    = 2023;
Car3.dateCurrent    = 2023;
Car3.id             = "Car3";

%% History structure
History           = struct;

%% Assign values car rental business
CarRentalBusiness.currentDate       = currentDate;
CarRentalBusiness.age               = age;
CarRentalBusiness.carIdentities     = carIdentities;
CarRentalBusiness.Car1              = Car1;
CarRentalBusiness.Car2              = Car2;
CarRentalBusiness.Car3              = Car3;
CarRentalBusiness.cash              = cash;
CarRentalBusiness.History           = History;
