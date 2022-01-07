Original App Design Project - README Template
===

# APP_NAME_HERE CheepyFly, Save N' Fly, TripShark ? 

## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
2. [Schema](#Schema)

## Overview
### Description
This app will allow you to input a budget and then it will find hotels and flights that fit this budget, it will use Amadeus API to retrieve this information.

### App Evaluation
[Evaluation of your app across the following attributes]
- **Category:** Travel
- **Mobile:** The app will be designed as a way to bring the website and API to a smaller screen with IOS unique screen controls and implementing things such as
pull to refresh.
- **Story:** Allows users to plan flights/vacations ahead of time based on their budget.
- **Market:** Anyone that travels needs a budget for flying and for their stay. Our app would allow them to have that covered all in one place
- **Habit:** This app has high reusability, since everytime you fly or stay somewhere you will always have a different budget and different needs for accomidations.
- **Scope:** Right now our scope is very narrow, in that we want to focus on getting all the listed hotels/flights for a specific budget. Later on we could possibly expand to other options like renting cars or things to do once they arrive in the city they are flying to.

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

- [x] Must be able to pull information from the API.
- [x] Main screen shows destinations.
- [x] Must display list to user.
- [ ] Flights Screen must show deals
- [ ] Must have app icon
- [ ] User must be able to input data for flight lookup
- [ ] Must allow user to select from list.
- [ ] Must allow user to email themselves the itinerary chosen from the data pulled.

**Optional Nice-to-have Stories**

- [ ] Must be able to allow users to create an account. 
- [ ] Must be able to allow users to log into an account. 
- [ ] Must be able to allow users to log out from an account. 

### 2. Screen Archetypes

* Deals Screen
   * Upon downloading and loading up the application, the user will be greeted with a screen with randomized deals which can be checked out immediately. 
   * If the deals do not interest the user, they can search for a specific destination in the search tab located at the top of this screen. 
   * If the search is triggered, it will direct them to the Main Budget Screen. 
* Main Screen - Budget Search
   * The user will input here:
     * Where they they are flying from
     * Where they want to fly
     * The date of departure
     * The return date
     * The overall trip budget
   * Once they hit submit, it will lead them to the next page with a tab menu
* Tab Menu Page: Flights
   * The user will be prompted with all the flights that fit their budget.
   * They can pick any one from the list. Once a flight is chosen, it will deduct that amount from the budget and reflect their remaining balance in real-time. 
   * They can toggle back and forth from Hotel and Flights to choose their flight and Hotel itinerary. 
* Tab Menu Page: Hotel
   * The user will be prompted with all the hotels that fit their budget.
   * They can pick any one from the list. Once a hotel is chosen, it will deduct that amount from the budget and reflect their remaining balance in real-time. 
   * They can toggle back and forth from Hotel and Flights to choose their flight and Hotel itinerary. 
   * After the flight and hotel is chosen, they will be prompted to the last screen, the confirmation screen. 
* Confirmation Screen: My trip
   * This will display the hotel and flight chosen by the user.
   * If they are unsatfised with any of their choices, they can go back and readjust their itinerary.
   * The screen will also display how much of their budget has been used and the remaining balance.
   * They will have the option to email themselves their itinerary for booking purposes. 



### 3. Navigation

**Tab Navigation** (Tab to Screen)

* Flights
* Hotels

Optional:

* Car rental

**Flow Navigation** (Screen to Screen)

* Home page (Deals Screen) -> Budget and search page 
   * Optional:  -> home page deal details
   
* Budget Search -> Budget, dates and destination will be input and submited by the user
* Flights -> Lets the user choose a flight
* Hotels -> Lets the user choose a hotel
* Car rental (optional) -> Lets the user choose a car
* My trip -> shows detalis about the trip and the user's budget
   * Optional:  -> deal is sent to the user's email


## Wireframes

<img src="https://i.imgur.com/9V24jb1.jpg" width=600>

## Schema
### Models
Flights/Hotels
| Property  | Type | Description |
| ------------- | ------------- | ------------- |
| From  | String  | 3 Character Airport Code |
| To  | String  | 3 Character Airport Code |
| FromDate  | String  | Origin Date of flight/hotel departure in String format |
| ToDate  | String  | Origin Date of flight/hotel arrival in String format |
| Budget  | String  | Max amount of money available for flight/hotel |
| Price  | String  | Price of flight/hotel |
### Networking
- [Add list of network requests by screen ]
-  Initial Screen:
- (Read/GET) Show list random deals to the user
- Second Screen:
- (No request) User will input values to be used for the request on the next screen
- Tabbed Screen:
- (Read/GET) Using user values to query the API for deals based on price, dates, and locations
- Final Screen:
- (No request) Display the final selections user made on the previous screen.
- [OPTIONAL: List endpoints if using existing API such as Yelp]


## Gifs
### Unit 10

<img src="http://g.recordit.co/xPoQX7bNF3.gif" height width=300>
<img src="https://user-images.githubusercontent.com/56565291/141892189-0cc41a38-8f8d-4272-858f-d99538a3a1e7.gif" height width=300>

### Unit 11

<img src="https://user-images.githubusercontent.com/56565291/142969816-1c1f5361-9179-4e8f-b57d-dd86f6e8693f.gif" height width=300>
<img src="https://user-images.githubusercontent.com/56565291/142970033-69ba0bd0-5037-4e0f-ac47-9a424090026a.gif" height width=300>




