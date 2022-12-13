const functions = require("firebase-functions");
const axios = require('axios');
const config = functions.config();
const admin = require('firebase-admin');
admin.initializeApp();

const temporal_get = (path, onSucess) => axios.get(`${config.temporal.url}/${path}`, {
    headers: {
        'Authorization': `Bearer ${config.temporal.key}`
    }
}).then(res => onSucess(res.data));

exports.updateFirestore = functions.https.onRequest((request, response) => {
    temporal_get("request/all/last", last_items => {
        let plants = admin.firestore().collection('plants');

        for (item of last_items) {
            let doc = plants.doc(item.sensor_mac.toUpperCase());

            doc.update({
                illumination: item.illumination,
                humidity: item.humidity,
                temperature: item.temperature,
                voltage: item.voltage,
                soilHumidity: item.soil_humidity,
                soilSalt: item.soil_salt,
            })
        }

        response.send("Success");
    });
});
