import 'package:mart_app/constants/export.dart';

// social buttons list
List socialImages = [icFacebookLogo, icGoogleLogo];
List socialNames = ["Facebook", "Google"];

// home screen slider brand widget list
List brandList = [imgSlider1, imgSlider2, imgSlider3, imgSlider4];
List secondBrandList = [imgSs1, imgSs2, imgSs3, imgSs4];

// lists for the home buttons

List<Map<String, dynamic>> dealNames1 = [
  {"icon": icTodaysDeal, "dealName": "Today Deals"},
  {"icon": icFlashDeal, "dealName": "Flash Sale"},
];

List<Map<String, dynamic>> dealNames2 = [
  {"icon": icTopCategories, "dealName": "Top Categories"},
  {"icon": icBrands, "dealName": "Brands"},
  {"icon": icTopSeller, "dealName": "Top Sellers"},
  {"icon": icWholeSale, "dealName": "Whole Sale"},
];

// lists for the featured buttons
List<Map<String, dynamic>> featuredList = [
  {"icon": imgS1, "text": "Women Fashion"},
  {"icon": imgS2, "text": "Girls Watches"},
  {"icon": imgS3, "text": "Mobile Phones & Tablets"},
  {"icon": imgS4, "text": "Girls Dress"},
  {"icon": imgS5, "text": "Boys Glasses"},
  {"icon": imgS6, "text": "T Shirts"},
];

// List for the featured products
List<Map<String, dynamic>> featuredProducts = [
  {"image": imgP1, "product": "Laptop", "price": "400000pkr"},
  {"image": imgP2, "product": "Cosmetics", "price": "5000"},
  {"image": imgP3, "product": "Apple MacBook", "price": "\$3000"},
  {"image": imgP4, "product": "Ladies Shoes", "price": "10000"},
  {"image": imgP5, "product": "Ladies Purse", "price": "3000"},
  {"image": imgP6, "product": "Men Sneakers", "price": "3500"},
  {"image": imgP7, "product": "Men's Glasses", "price": "750"},
];

// List for the on Sale Images
List<String> onSale = [imgFd1, imgFd2, imgFd3];

// List for the All Products
List<String> allProducts = [imgP1, imgP2, imgP3, imgP4, imgP5, imgP6];

// Lists for the categoreis screen
List<Map<String, dynamic>> categoriesList = [
  {"categoryName": menClothingFashion, "img": imgFc1},
  {"categoryName": computerAccess, "img": imgFc2},
  {"categoryName": garments, "img": imgFc3},
  {"categoryName": kidToys, "img": imgFc4},
  {"categoryName": sports, "img": imgFc5},
  {"categoryName": phones, "img": imgFc6},
  {"categoryName": cosmetics, "img": imgFc7},
  {"categoryName": womenFashion, "img": imgFc8},
  {"categoryName": furniture, "img": imgFc9},
  {"categoryName": jewelry, "img": imgFc10},
  {"categoryName": stationary, "img": imgFc11},
];

// item_details_widget sub-widgets list
List<String> itemButtonsList = [
  "Video",
  "Reviews",
  "Seller Policy",
  "Return Policy",
  "Support Policy",
];

// List for the cart,whishlist and order section of the profile screen

List<Map<String, dynamic>> cartwhishlistorderSection = [
  {"value": 00, "name": "in your cart"},
  {"value": 00, "name": "in your wishlist"},
  {"value": 00, "name": "you ordered"},
];

// profile buttons list
List<Map<String, dynamic>> profileButtonsList = [
  {"name": "My Orders", "icon": icOrder},
  {"name": "My Wishlist", "icon": icWallet},
  {"name": "Messages", "icon": icMessages},
];

List<Map<String, dynamic>> paymentMethodList = [
  {"name": paypal, "img": imgPaypal},
  {"name": stripe, "img": imgStripe},
  {"name": cod, "img": imgCod},
];
