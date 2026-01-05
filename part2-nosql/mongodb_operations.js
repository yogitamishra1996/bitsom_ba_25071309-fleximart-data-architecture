// FlexiMart MongoDB Operations Script

// Operation 1: Load Data
// Use mongoimport from terminal: 
// mongoimport --db fleximart --collection products --file products_catalog.json --jsonArray
db.products.insertMany(JSON.parse(products_catalog.json)); // Alternative shell method

// Operation 2: Basic Query
// Find Electronics < 50000, returning only name, price, and stock
db.products.find(
  { category: "Electronics", price: { $lt: 50000 } },
  { name: 1, price: 1, stock: 1, _id: 0 }
);

// Operation 3: Review Analysis
// Find products with average rating >= 4.0 using aggregation
db.products.aggregate([
  {
    $project: {
      name: 1,
      avgRating: { $avg: "$reviews.rating" } // Calculate average from nested array
    }
  },
  {
    $match: { avgRating: { $gte: 4.0 } } // Filter by the calculated average
  }
]);

// Operation 4: Update Operation
// Add a new review to product "ELEC001"
db.products.updateOne(
  { product_id: "ELEC001" },
  { 
    $push: { 
      reviews: {
        user: "U999", 
        rating: 4, 
        comment: "Good value", 
        date: new ISODate() // Add system timestamp
      } 
    } 
  }
);

// Operation 5: Complex Aggregation
// Calculate average price and product count per category, sorted by price
db.products.aggregate([
  {
    $group: {
      _id: "$category", // Group by category field
      avg_price: { $avg: "$price" },
      product_count: { $sum: 1 }
    }
  },
  {
    $project: {
      category: "$_id", // Rename _id to category for readability
      avg_price: 1,
      product_count: 1,
      _id: 0
    }
  },
  {
    $sort: { avg_price: -1 } // Sort descending by average price
  }
]);