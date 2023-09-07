function CarRentalBusiness = despenseCar(CarRentalBusiness, carIdentity)
% This function calculates the car rental business state after the despense of a car

% Load the specific car
Car     = CarRentalBusiness.(carIdentity);

% Generate the data of the car
CarData = generateCarData(Car);

% Calculate the car despense
CarDespense = calculateCarDespense(CarData);

% Update the car rental business
CarRentalBusiness.cash = CarRentalBusiness.cash + CarDespense.Income - CarDespense.Tax;
CarRentalBusiness = rmfield(CarRentalBusiness, carIdentity);

carIdentitiesNew = string;
carIdentitiesNewSize = 0;
for iCarIdentity = 1 : length(CarRentalBusiness.carIdentities)
    if ~strcmp(CarRentalBusiness.carIdentities(iCarIdentity),carIdentity)
        carIdentitiesNewSize = carIdentitiesNewSize + 1;
        carIdentitiesNew(carIdentitiesNewSize) = CarRentalBusiness.carIdentities(iCarIdentity);
    end
end
CarRentalBusiness.carIdentities = carIdentitiesNew;
