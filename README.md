# Flight delay prediction IOS app

This project is a part of Bachelor Thesis for Computer Science Degree titled "System for predicting flight delays"

##Prediction model

Prediction model used for this app is implemented in [this repository.] (https://github.com/agatachamula/flight-delay-prediction-model)
Trained in python, exported using coremltools into format .mlmodel format suitable for programming in SWIFT.

## Final app

User inputs their flight information with the help of drop down list.
Using dictionaries, the app translates user input from strings to numerical values that are used as an input for the prediction model.
Outpuot of the model is a numerical value corresponding to class of delay. This value is then translated into image and text displayed for the user on the screen.

Screenshots from the final app:

<img src="https://github.com/agatachamula/flight-delay-prediction-ios-app/blob/master/Screens/image17.png?raw=true"> <img src="https://github.com/agatachamula/flight-delay-prediction-ios-app/blob/master/Screens/image18.png?raw=true"> <img src="https://github.com/agatachamula/flight-delay-prediction-ios-app/blob/master/Screens/image19.png?raw=true">
<img src="https://github.com/agatachamula/flight-delay-prediction-ios-app/blob/master/Screens/image20.png?raw=true"> <img src="https://github.com/agatachamula/flight-delay-prediction-ios-app/blob/master/Screens/image21.png?raw=true"> <img src="https://github.com/agatachamula/flight-delay-prediction-ios-app/blob/master/Screens/image22.png?raw=true">


## Acknowledgments

Icons used in this application are provded free of charge by [Flaticon]. (https://www.flaticon.com/)
