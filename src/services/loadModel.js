const tf = require('@tensorflow/tfjs-node');

async function loadModel() {
    const url = "https://storage.googleapis.com/modelml-submission-mlgc-ihsanalif/model.json"
    const modelUrl = process.env.MODEL_URL || url;
    return tf.loadGraphModel(modelUrl);
}

module.exports = loadModel;