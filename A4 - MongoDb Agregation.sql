Assignment#4 - 301129230 Seyeon Jo

Q1. Find all listings with listing_url, name, address, host_verification and size of host_verification array in the listingsAndReviews collection that have a host with at least 3 verification and collection that have a host with a picture url.

#Answer for Q1
```
db.listingsAndReviews.aggregate([
  {
    $match: {
      $or: [
        {
          "host.host_verifications": { $exists: true },
          $expr: { $gte: [{ $size: "$host.host_verifications" }, 3] }
        },
        {
          "host.picture_url": { $exists: true }
        }
      ]
    }
  },
  {
    $project: {
      "listing_url": 1,
      "name": 1,
      "address": 1,
      "host.host_verifications": 1,
      "host.picture_url": 1,
      "host_verifications_count": { $size: "$host.host_verifications" }
    }
  }
])
```

Q2. Write a MongoDB query to find the name, address, and cuisine of the restaurants that have a cuisine that contains the word 'Pizza' and achieved highest average score.

#Answer for Q2
```
db.restaurants.aggregate([
  {
    $match: {
      cuisine: { $regex: /Pizza/i }
    }
  },
  {
    $group: {
      _id: "$name",
      address: { $first: "$address" },
      cuisine: { $first: "$cuisine" },
      averageScore: { $avg: "$grades.score" }
    }
  },
  {
    $sort: {
      averageScore: -1
    }
  },
  {
    $limit: 3
  },
  {
    $project: {
      _id: 0,
      name: "$_id",
      address: 1,
      cuisine: 1
    }
  }
])
```

Q3. Write a MongoDB query to find the restaurants that has highest number of "A" grades for the cuisine "Turkish".

#Answer for Q3
```
db.restaurants.aggregate([
  {
    $match: {
      cuisine: "Turkish"
    }
  },
  {
    $unwind: "$grades"
  },
  {
    $match: {
      "grades.grade": "A"
    }
  },
  {
    $group: {
      _id: "$name",
      totalAgrades: { $sum: 1 },
      avgScore: { $avg: "$grades.score" }
    }
  },
  {
    $sort: {
      totalAgrades: -1
    }
  },
  {
    $limit: 3
  },
  {
    $project: {
      _id: 0,
      name: "$_id",
      totalAgrades: 1,
      avgScore: 1
    }
  }
])
```

Q4. Write a MongoDB query to find the top 5 restaurants with the highest average score for Chinese restaurants, along with their average scores.

#Answer for Q4
```
db.restaurants.aggregate([
  {
    $unwind: "$grades"
  },
  {
    $match: {
      cuisine: "Chinese"
    }
  },
  {
    $group: {
      _id: { cuisine: "$cuisine", restaurant_id: "$restaurant_id" },
      avgScore: { $avg: "$grades.score" }
    }
  },
  {
    $sort: {
      "_id.cuisine": 1,
      avgScore: -1
    }
  },
  {
    $group: {
      _id: "$_id.cuisine",
      topRestaurants: { $push: { restaurant_id: "$_id.restaurant_id", avgScore: "$avgScore" } }
    }
  },
  {
    $unwind: "$topRestaurants"
  },
  {
    $sort: {
      "_id": 1,
      "topRestaurants.avgScore": -1
    }
  },
  {
    $group: {
      _id: "$_id",
      topRestaurants: { $push: "$topRestaurants" }
    }
  },
  {
    $project: {
      _id: 0,
      cuisine: "$_id",
      topRestaurants: { $slice: ["$topRestaurants", 5] }
    }
  }
])
```
