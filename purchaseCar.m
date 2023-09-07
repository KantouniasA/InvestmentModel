function CarRentalBusiness = purchaseCar(CarRentalBusiness, Car)
% This function calculates the car rental business state after the purchase of a car

% Generate the data of the car
CarData = generateCarData(Car);

% Calculate the car despense
CarPurchase = calculateCarPurchase(CarData);

% Update the car rental business
CarRentalBusiness.cash = CarRentalBusiness.cash - CarPurchase.Cost + CarPurchase.TaxReturn;
CarRentalBusiness.(Car.id) = Car;
CarRentalBusiness.carIdentities = [CarRentalBusiness.carIdentities, Car.id];