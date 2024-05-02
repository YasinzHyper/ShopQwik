# ShopQwik

A full stack shopping application with an admin panel and a variety of other features.

## Features
### Admin Panel
    - Add, delete and view Products
    - Deleting Products
    - View Orders
    - Changing Order Status
    - View Total Earnings
    - View Category Wise Earning Data (on a Graph)
### User Side
    - Email & Password Authentication
    - Searching and Filtering Products (Based on Category)
    - Rating the products and displaying the averge rating on product detail page
    - Viewing Product Details
    - Fetching and displaying Deal of the Day
    - Cart Screen to increase/decrease product quantity
    - Viewing Orders, order details and status
    - Check out with Google pay / cash on delivery
    - Sign Out


## Steps to Run:
### Step 1: Server side
```bash
  cd server
  npm install
  npm run dev (for continuous development)
```

### Step 2:

First make sure to open up a simulator (android) or connect a physical device.

```bash
  flutter pub get
  flutter run
```

## Tech used: 

**Server**: Node.js, Express, Mongoose, MongoDB, Cloudinary, Heroku

**Client**: Flutter, Provider, http, sharedpreferences, pay, file_picker.
