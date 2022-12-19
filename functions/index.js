const functions = require("firebase-functions");
const region = functions.region('europe-west1');
const axios = require('axios');
const config = functions.config();
const admin = require('firebase-admin');
admin.initializeApp();

const temporal_get = (path, onSucess) => axios.get(`${config.temporal.url}/${path}`, {
    headers: {
        'Authorization': `Bearer ${config.temporal.key}`
    }
}).then(res => onSucess(res.data));

exports.updateFirestore = region.https.onRequest((request, response) => {
    temporal_get("request/all/last", last_items => {
        let plants = admin.firestore().collection('plants');

        for (item of last_items) {
            let doc = plants.doc(item.sensor_uid);
            let d = new Date(item.created);
            let timestamp = new admin.firestore.Timestamp(Math.round(d.getTime() / 1000), 0);

            doc.get('isCalibrating').then(isCalibrating => {
                if (isCalibrating) {
                    doc.update({
                        isCalibrating: false,
                        calibrationWet: item.soil_humidity,
                    });
                }
            });

            doc.update({
                illumination: item.illumination,
                humidity: item.humidity,
                temperature: item.temperature,
                voltage: item.voltage,
                soilHumidity: item.soil_humidity,
                soilSalt: item.soil_salt,
                lastUpdated: timestamp,
            })
        }

        response.json({ result: 'Success' });
    });
});
