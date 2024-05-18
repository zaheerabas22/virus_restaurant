const Restaurant = require('../models/Restaurant');
const User = require('../models/User');
module.exports = {

    addRestaurant: async (req, res) => {
        const owner = req.user.id;
        const { title, time, imageUrl, code, logoUrl, coords } = req.body;
    
        // Check if required fields are not empty
        if (!title || !time || !imageUrl ||  !code || !logoUrl || !coords || !coords.latitude || !coords.longitude || !coords.address || !coords.title) {
            return res.status(400).json({ status: false, message: 'Missing required fields' });
        }
    
        // Check if the restaurant code already exists
        const existingRestaurant = await Restaurant.findOne({ owner: owner });
        if (existingRestaurant) {
            return res.status(400).json({ status: false, message: 'Restaurant with this code already exists', data: existingRestaurant });
        }
    
        const newRestaurant = new Restaurant(req.body);
    
        try {
            await newRestaurant.save();
            await User.findByIdAndUpdate(
                owner,
                { userType: "Vendor" },
                { new: true, runValidators: true });
            

            res.status(201).json({ status: true, message: 'Restaurant successfully created' });
        } catch (error) {
            res.status(500).json({status: false, message: error.message });
        }
    },

    getRestaurantById: async (req, res) => {
        const id = req.params.id;
        try {
            const restaurant = await Restaurant.findById(id);

            res.status(200).json(restaurant);
        } catch (error) {
            res.status(500).json({ status: false, message: error.message });
        }
    },

    getRandomRestaurants: async (req, res) => {
        const code = req.params.code;
        try {
            let randomRestaurant = [];

            if (code) {
                randomRestaurant = await Restaurant.aggregate([
                    { $match: { code: code, isAvailable: true } },
                    { $sample: { size: 5 } },
                    { $project: { __v: 0 } }
                ]);
            }

            if (randomRestaurant.length === 0) {
                randomRestaurant = await Restaurant.aggregate([
                    { $match: { isAvailable: true } },
                    { $sample: { size: 5 } },
                    { $project: { __v: 0 } }
                ]);
            }

            res.status(200).json(randomRestaurant);
        } catch (error) {
            res.status(500).json({ status: false, message: error.message });
        }
    },

    getAllNearByRestaurants: async (req, res) => {
        const code = req.params.code;
        try {
            let allNearByRestaurants = [];

            if (code) {
                allNearByRestaurants = await Restaurant.aggregate([
                    { $match: { code: code, isAvailable: true } },
                    { $project: { __v: 0 } }
                ]);
            }

            if (allNearByRestaurants.length === 0) {
                allNearByRestaurants = await Restaurant.aggregate([
                    { $match: { isAvailable: true } },
                    { $project: { __v: 0 } }
                ]);
            }

            res.status(200).json(allNearByRestaurants);

        } catch (error) {
            res.status(500).json({ status: false, message: error.message });
        }
    },

    getRestaurantByOwner : async(req, res) => {

        const owner = req.user.id;
        try {
            const restaurant = await Restaurant.findOne({ owner: owner });
            if (!restaurant) {
                return res.status(404).json({ status: false, message: 'Restaurant not found' });
            }

            res.status(200).json(restaurant);
        }catch(e){
            res.status(500).json({ status: false, message: e.message });
        }
    }
}