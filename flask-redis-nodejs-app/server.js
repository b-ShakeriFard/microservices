const express = require('express');
const { createClient } = require('redis');
const app = express();



(async () => {

	// connect to redis container via container name and port
	//
	const redisUrl = process.env.REDIS_URL || 'redis://localhost:6379';
	const redisClient = createClient({
		url: 'redis://redis-service:6379',
	});
	
	// in case of error, pass an error message
	redisClient.on('error', (err) => console.error('Redis Client Error',err));
	
	try {
		// wait for connection
		await redisClient.connect();
		console.log('Connected to Redis');
	} catch (err) {
		console.error('Failed to connect to Redis!', err);

	}

	app.get('/',async (req,res) => {

		try {
			// fetch key value pairs
			//
			// fetch keys
			const keys = await redisClient.keys('*');

			// make sure redis is not empty
			if (keys.length === 0) {
				return res.send('No keys found in Redis.');
			}
			
			// we know the keys!
			
//			const keys = ['key1','key2']
			// retrieve values
			const values = await redisClient.mGet(keys);

			// retrieve values, and map them to keys
			//
			const keyValues = keys.map((key, index) => ({
				key: key,
				value: values[index],
			}));

		// alternatively, you could fetch values one by one!
		//const value1 = await redis.get('key1');
		//const value2 = await redis.get('key2');
		
		// Display results
			
		let html = '<h1> Redis Key-Value Pairs </h1> <ul>';
		keyValues.forEach((kv) => {
			html+= `<li> <strong> ${kv.key} </strong>: ${kv.value}</li> `;
		});
		html+= '</ul>';

		res.send(html);

		} catch (err) {
		console.error('Error connecting to Redis:', err)
		res.status(500).send('Error retrieving data from Redis! ');
		}


	});


	// Global Error Handler
	//
	app.use((err,req,res,next) => {
		console.error('unhandled error', err);
		res.status(500).send('<h1> Internal Server Error. </h1> <br> <p> Something went wrong </p>');
	
	});

const PORT = 3001;

app.listen(PORT, () => {
	console.log('Node.js app litening on ${PORT}');

});
})();
