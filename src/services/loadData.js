const { Firestore } = require("@google-cloud/firestore");

async function loadData() {
  const db = new Firestore({
    keyFilename: process.env.GOOGLE_APPLICATION_CREDENTIALS,
    projectId: 'submissionmlgc-ihsanalif',
    databaseId: 'predictions',
  });

  const predictCollection = db.collection('predictions');

  const snapshot = await predictCollection.get();

  const data = [];
  snapshot.forEach((doc) => {
    data.push({
      id: doc.id,
      history: doc.data(),
    });
  });

  return data;
}

module.exports = loadData;
